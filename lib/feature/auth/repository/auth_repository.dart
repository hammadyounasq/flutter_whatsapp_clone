import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone_again/core/common/constant/firebase_constant.dart';
import 'package:whatsapp_clone_again/feature/auth/screen/otp_screen.dart';
import 'package:whatsapp_clone_again/feature/auth/screen/user_information_screen.dart';

import '../../../core/provider/firebase_provider.dart';
import '../../../utils/utils.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
    firestore: ref.read(firestoreProvider),
    firebaseAuth: ref.read(authProvider)));

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  AuthRepository(
      {required FirebaseFirestore firestore,
      required FirebaseAuth firebaseAuth})
      : _firestore = firestore,
        _firebaseAuth = firebaseAuth;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

// void signInwithPhone(BuildContext context, String phoneName) async {
//     try {
//       await auth.verifyPhoneNumber(
//           phoneNumber: phoneName,
//           verificationCompleted: (PhoneAuthCredential credential) async {
//             await auth.signInWithCredential(credential);
//           },
//           verificationFailed: (e) {
//             throw Exception(e.message);
//           },
//           codeSent: ((String verificationId, int? resendToken) async {
//             Navigator.pushNamed(context, OTPScreen.routeName,
//                 arguments: verificationId);
//           }),
//           codeAutoRetrievalTimeout: (String verificationId) {});
//     } on FirebaseAuthException catch (e) {
//       showSnackBar(context: context, content: e.toString());
//     }
//   }

  void signInwithPhone(BuildContext context, String phoneName) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneName,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _firebaseAuth.signInWithCredential(credential);
          },
          verificationFailed: (e) {
            throw Exception(e.message);
          },
          codeSent: (String verificationId, int? resendToken) async {
            Navigator.pushNamed(context, OTPScreen.routeName,
                arguments: verificationId);
          },
          codeAutoRetrievalTimeout: (String verificationId) {});
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }

  //  void VerifyOTP(BuildContext context, String verifyId, String userOTp) async {
  //   try {
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //         verificationId: verifyId, smsCode: userOTp);
  //     await auth.signInWithCredential(credential);
  //     Navigator.pushNamedAndRemoveUntil(
  //         context, UserInformationScreen.routeName, (route) => false);
  //   } on FirebaseAuthException catch (e) {
  //     showSnackBar(context: context, content: e.toString());
  //   }
  // }

  void verifyOTP(BuildContext context, String verifyId, String userOTP) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verifyId, smsCode: userOTP);
      await _firebaseAuth.signInWithCredential(credential);
      Navigator.pushNamedAndRemoveUntil(
          context, UserInformationScreen.routeName, (route) => false);
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}
