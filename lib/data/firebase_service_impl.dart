import 'dart:async';


import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import '../core/exceptions/exceptions.dart';
import '../core/services/firebase_service.dart';
import '../model/auth_user.dart';
import '../model/review.dart';

class FireBaseServiceImpl implements FireBaseService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<String> sendOtp({required String phoneNo}) async {
    String vid = '';
    final Completer<dynamic> c = Completer<dynamic>();
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      codeSent: (String verificationId, int? resendToken) async {
        vid = verificationId;
        if (!c.isCompleted) {
          c.complete();
        }
      },
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        await auth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (FirebaseAuthException error) {
        throw error;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        vid = verificationId;
        if (!c.isCompleted) {
          c.complete();
        }
      },
    );
    await Future.wait(<Future<dynamic>>[c.future]);
    return vid;
  }

  @override
  Future<void> verifyOtp({required String smsCode, required String vid}) async {
    final PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: vid, smsCode: smsCode);

    // Sign the user in (or link) with the credential
    final UserCredential user = await auth.signInWithCredential(credential);
    final String? uid = user.user?.uid;
    if (uid == null) {
      throw  FirebaseAppException('user not found');
    }
    return;
  }

  CollectionReference<Map<String, dynamic>> get userCollection =>
      firestore.collection('users');

  CollectionReference<Map<String, dynamic>> get movieCollection =>
      firestore.collection('movie');

  CollectionReference<Map<String, dynamic>> get tvCollection =>
      firestore.collection('tv');

  CollectionReference<Map<String, dynamic>> movieReviewCollection(String movieId) =>
      movieCollection.doc(movieId).collection('review');

  CollectionReference<Map<String, dynamic>> tvReviewCollection(String tvId) =>
      tvCollection.doc(tvId).collection('review');

  @override
  Future<AuthUser> getUser(
      {required String uid, required String phoneNo}) async {
    final DocumentReference<Map<String, dynamic>> userDoc = userCollection.doc(uid);
    final Map<String, dynamic>? userData = (await userDoc.get()).data();
    if (userData == null) {
      final AuthUser authUser = AuthUser(
        (AuthUserBuilder b) => b
          ..phoneNo = phoneNo
          ..id = uid,
      );
      userDoc.set(authUser.toJson());
      return authUser;
    }
    return AuthUser.fromJson(userData);
  }

  @override
  Future<void> createMovieReview(
      {required String movieId, required Review review}) async {
    final DocumentReference<Map<String, dynamic>> doc = movieReviewCollection(movieId).doc();
    final Review a = review.rebuild((ReviewBuilder b) => b.id = doc.id);
    await doc.set(a.toJson());
  }

  @override
  Future<void> createTVReview(
      {required String tvId, required Review review}) async {
    final DocumentReference<Map<String, dynamic>> doc = tvReviewCollection(tvId).doc();
    final Review a = review.rebuild((ReviewBuilder b) => b.id = doc.id);
    await doc.set(a.toJson());
  }

  @override
  Future<void> deleteMovieReview(
      {required String movieId, required String reviewId}) async {
    final DocumentReference<Map<String, dynamic>> doc = movieReviewCollection(movieId).doc(reviewId);
    await doc.delete();
  }

  @override
  Future<void> deleteTVReview(
      {required String tvId, required String reviewId}) async {
    final DocumentReference<Map<String, dynamic>> doc = tvReviewCollection(tvId).doc(reviewId);
    await doc.delete();
  }

  @override
  Future<Review> getMovieReview(
      {required String movieId, required String reviewId}) async {
    final DocumentSnapshot<Map<String, dynamic>> doc =
        await movieReviewCollection(movieId).doc(reviewId).get();
    final Map<String, dynamic>? data = doc.data();
    if (data == null) {
      throw FirebaseAppException('movie not available');
    }
    return Review.fromJson(data);
  }

  @override
  Future<Review> getTvReview(
      {required String tvId, required String reviewId}) async {
    final DocumentSnapshot<Map<String, dynamic>> doc =
        await tvReviewCollection(tvId).doc(reviewId).get();
    final Map<String, dynamic>? data = doc.data();
    if (data == null) {
      throw FirebaseAppException('tv review not available');
    }
    return Review.fromJson(data);
  }

  @override
  Stream<BuiltList<Review>> listenMovieReview({required String movieId}) {
    final Stream<QuerySnapshot<Map<String, dynamic>>> snapshots = movieReviewCollection(movieId).snapshots();

    return snapshots.map(
      (QuerySnapshot<Map<String, dynamic>> b) => b.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> e) => Review.fromJson(e.data())).toBuiltList(),
    );
  }

  @override
  Stream<BuiltList<Review>> listenTVReview({required String tvId}) {
    final Stream<QuerySnapshot<Map<String, dynamic>>> snapshots = movieReviewCollection(tvId).snapshots();

    return snapshots.map(
      (QuerySnapshot<Map<String, dynamic>> b) => b.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> e) => Review.fromJson(e.data())).toBuiltList(),
    );
  }

  @override
  Future<void> updateMovieReview(
      {required String movieId, required Review review}) async {
    await movieReviewCollection(movieId).doc(review.id).set(review.toJson());
  }

  @override
  Future<void> updateTvReview(
      {required String tvId, required Review review}) async {
    await tvReviewCollection(tvId).doc(review.id).set(review.toJson());
  }


  @override
  Future<AuthUser> updateUser({required AuthUser user}) async {
    await userCollection.doc(user.id).set(user.toJson());
    return user;
  }

  @override
  Future<AuthUser> updateProfile({required Uint8List file, required AuthUser user}) async {

    final Reference storageRef = FirebaseStorage.instance.ref();
    final Reference userProfileRef = storageRef.child('users/${user.id}.jpg');
    try {
      await userProfileRef.putData(file);
      final String url = await userProfileRef.getDownloadURL();

     return await updateUser(user: user.rebuild((AuthUserBuilder a)=>a.profile = url));
    } on FirebaseException {
      rethrow;
    }
  }
}
