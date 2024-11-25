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
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

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
      throw FirebaseAppException('user not found');
    }
    return;
  }



 CollectionReference<AuthUser> get users =>
      userCollection.withConverter(
        fromFirestore: (
            DocumentSnapshot<Map<String, dynamic>> snap,
            SnapshotOptions? options,
            ) {
          final Map<String, dynamic> data = snap.data()!;
          return AuthUser.fromJson(data);
        },
        toFirestore: (AuthUser? data, SetOptions? options) {
          assert(data?.id.isNotEmpty ?? false);
          return data!.toJson();
        },);


  CollectionReference<Review>  movieReviews(String movieId) =>
      movieReviewCollection(movieId).withConverter(
        fromFirestore: (
            DocumentSnapshot<Map<String, dynamic>> snap,
            SnapshotOptions? options,
            ) {
          final Map<String, dynamic> data = snap.data()!;
          return Review.fromJson(data);
        },
        toFirestore: (Review? data, SetOptions? options) {
          assert(data?.id.isNotEmpty ?? false);
          return data!.toJson();
        },);

  CollectionReference<Review>  tvReviews(String tvId) =>
      tvReviewCollection(tvId).withConverter(
        fromFirestore: (
            DocumentSnapshot<Map<String, dynamic>> snap,
            SnapshotOptions? options,
            ) {
          final Map<String, dynamic> data = snap.data()!;
          return Review.fromJson(data);
        },
        toFirestore: (Review? data, SetOptions? options) {
          assert(data?.id.isNotEmpty ?? false);
          return data!.toJson();
        },);

  CollectionReference<Map<String, dynamic>> get userCollection =>
      fireStore.collection('users');

  CollectionReference<Map<String, dynamic>> get movieCollection =>
      fireStore.collection('movie');

  CollectionReference<Map<String, dynamic>> get tvCollection =>
      fireStore.collection('tv');

  CollectionReference<Map<String, dynamic>> movieReviewCollection(
      String movieId) =>
      movieCollection.doc(movieId).collection('review');

  CollectionReference<Map<String, dynamic>> tvReviewCollection(String tvId) =>
      tvCollection.doc(tvId).collection('review');

  @override
  Future<AuthUser> getUser(
      {required String uid, required String phoneNo}) async {
    final  DocumentReference<AuthUser> userDoc = users.doc(
        uid);
    final AuthUser? userData = (await userDoc.get()).data();
    if (userData == null) {
      final AuthUser authUser = AuthUser(
            (AuthUserBuilder b) =>
        b
          ..phoneNo = phoneNo
          ..id = uid,
      );
      userDoc.set(authUser);
      return authUser;
    }
    return userData;
  }

  @override
  Future<void> createMovieReview(
      {required String movieId, required Review review}) async {
    final DocumentReference<Review> doc = movieReviews(movieId).doc();
    // final DocumentReference<Map<String, dynamic>> doc = movieReviewCollection(
    //     movieId).doc();
    final Review a = review.rebuild((ReviewBuilder b) => b.id = doc.id);
    await doc.set(a);
    //await doc.set(a.toJson());
  }

  @override
  Future<void> createTVReview(
      {required String tvId, required Review review}) async {
    final DocumentReference<Review> doc = tvReviews(tvId).doc();
    // final DocumentReference<Map<String, dynamic>> doc = tvReviewCollection(tvId)
    //     .doc();
    final Review a = review.rebuild((ReviewBuilder b) => b.id = doc.id);
    await doc.set(a);
  }

  @override
  Future<void> deleteMovieReview(
      {required String movieId, required String reviewId}) async {
    final DocumentReference<Map<String, dynamic>> doc = movieReviewCollection(
        movieId).doc(reviewId);
    await doc.delete();
  }

  @override
  Future<void> deleteTVReview(
      {required String tvId, required String reviewId}) async {
    final DocumentReference<Map<String, dynamic>> doc = tvReviewCollection(tvId)
        .doc(reviewId);
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
    final Stream<
        QuerySnapshot<Map<String, dynamic>>> snapshots = movieReviewCollection(
        movieId).snapshots();

    return snapshots.map(
          (QuerySnapshot<Map<String, dynamic>> b) =>
          b.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> e) =>
              Review.fromJson(e.data())).toBuiltList(),
    );
  }

  @override
  Stream<BuiltList<Review>> listenTVReview({required String tvId}) {
    final Stream<
        QuerySnapshot<Map<String, dynamic>>> snapshots = movieReviewCollection(
        tvId).snapshots();

    return snapshots.map(
          (QuerySnapshot<Map<String, dynamic>> b) =>
          b.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> e) =>
              Review.fromJson(e.data())).toBuiltList(),
    );
  }

  @override
  Future<void> updateMovieReview(
      {required String movieId, required Review review}) async {
    await movieReviews(movieId).doc(review.id).set(review);
  }

  @override
  Future<void> updateTvReview(
      {required String tvId, required Review review}) async {
    await tvReviews(tvId).doc(review.id).set(review);
  }


  @override
  Future<AuthUser> updateUser({required AuthUser user}) async {
    await users.doc(user.id).set(user);
    return user;
  }

  @override
  Future<AuthUser> updateProfile(
      {required Uint8List file, required AuthUser user}) async {
    final Reference storageRef = FirebaseStorage.instance.ref();
    final Reference userProfileRef = storageRef.child('users/${user.id}.jpg');
    try {
      await userProfileRef.putData(file);
      final String url = await userProfileRef.getDownloadURL();

      return await updateUser(
          user: user.rebuild((AuthUserBuilder a) => a.profile = url));
    } on FirebaseException {
      rethrow;
    }
  }
}
