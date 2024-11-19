import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import '../core/services/firebase_service.dart';

class FireBaseServiceImpl implements FireBaseService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<String> sendOtp({required String phoneNo}) async {
    String vid = '';
    Completer _c = Completer();
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      codeSent: (String verificationId, int? resendToken) async {
        vid = verificationId ?? '';
        if (!_c.isCompleted) {
          _c.complete();
        }
      },
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        await auth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (FirebaseAuthException error) {
        throw error;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        vid = verificationId ?? '';
        if (!_c.isCompleted) {
          _c.complete();
        }
      },
    );
    await Future.wait([_c.future]);
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
      throw 'user not found';
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
    final userDoc = userCollection.doc(uid);
    final Map<String, dynamic>? userData = (await userDoc.get()).data();
    if (userData == null) {
      var authUser = AuthUser(
        (b) => b
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
    var doc = movieReviewCollection(movieId).doc();
    var a = review.rebuild((b) => b.id = doc.id);
    await doc.set(a.toJson());
  }

  @override
  Future<void> createTVReview(
      {required String tvId, required Review review}) async {
    var doc = tvReviewCollection(tvId).doc();
    var a = review.rebuild((b) => b.id = doc.id);
    await doc.set(a.toJson());
  }

  @override
  Future<void> deleteMovieReview(
      {required String movieId, required String reviewId}) async {
    var doc = movieReviewCollection(movieId).doc(reviewId);
    await doc.delete();
  }

  @override
  Future<void> deleteTVReview(
      {required String tvId, required String reviewId}) async {
    var doc = tvReviewCollection(tvId).doc(reviewId);
    await doc.delete();
  }

  @override
  Future<Review> getMovieReview(
      {required String movieId, required String reviewId}) async {
    final DocumentSnapshot<Map<String, dynamic>> doc =
        await movieReviewCollection(movieId).doc(reviewId).get();
    final Map<String, dynamic>? data = doc.data();
    if (data == null) {
      throw 'movie not available';
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
      throw 'tv not available';
    }
    return Review.fromJson(data);
  }

  @override
  Stream<BuiltList<Review>> listenMovieReview({required String movieId}) {
    var snapshots = movieReviewCollection(movieId).snapshots();

    return snapshots.map(
      (b) => b.docs.map((e) => Review.fromJson(e.data())).toBuiltList(),
    );
  }

  @override
  Stream<BuiltList<Review>> listenTVReview({required String tvId}) {
    var snapshots = movieReviewCollection(tvId).snapshots();

    return snapshots.map(
      (b) => b.docs.map((e) => Review.fromJson(e.data())).toBuiltList(),
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

     return await updateUser(user: user.rebuild((a)=>a.profile = url));
    } on FirebaseException catch (e) {
      rethrow;
    }
  }
}