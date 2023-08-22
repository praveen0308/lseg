import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:lseg/data/data.dart';
import 'package:lseg/data/remote/firebase_data_source/firestore_config.dart';
import 'package:lseg/data/remote/services/auth_service.dart';

class FirebaseAuthService extends AuthService {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Stream<UserEntity?> userLoggedIn() {
    return _firebaseAuth.userChanges().map((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        return null;
      } else {
        print('User is signed in!');
        UserEntity entity = UserEntity(
          userId: user.uid,
          name: user.displayName,
          email: user.email,
          phone: user.phoneNumber,
          profileUrl: user.photoURL,
        );

        return entity;
      }
    });
  }

  Future<UserEntity?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    var result = await _firebaseAuth.signInWithCredential(credential);
    var user = result.user;
    UserEntity entity = UserEntity(
      userId: user?.uid,
      name: user?.displayName,
      email: user?.email,
      phone: user?.phoneNumber,
      profileUrl: user?.photoURL,
    );

    return entity;
  }

  Future<UserEntity?> checkUserExists(String uid) async {
    var result = await FirebaseFirestore.instance
        .collection(userCollection)
        .doc(uid)
        .get();

    debugPrint("result -> $result");
    if (result.exists) {
      UserEntity userEntity = UserEntity.fromJson(result);
      return userEntity;
    } else {
      return null;
    }

    /*try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: user.email!,password: user.password!);
      verifyEmail();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }*/
  }

  Future<void> registerUser(UserEntity userEntity) async {
    return _firestore
        .collection(userCollection)
        .doc(userEntity.userId)
        .set(userEntity.toJson())
        .then((value) => print("User registered successfully!!!"));
  }
}
