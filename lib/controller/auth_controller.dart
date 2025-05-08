// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  Future<bool> signup({
    required String username,
    required String email,
    required String contact,
    required String role,
    required String password,
    required String confirmPassword,
  }) async {
    if (password != confirmPassword) {
      errorMessage.value = 'Passwords do not match';
      return false;
    }

    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
        .hasMatch(email)) {
      errorMessage.value = 'Please enter a valid email address';
      return false;
    }

    if (password.length < 6) {
      errorMessage.value = 'Password must be at least 6 characters long';
      return false;
    }

    try {
      isLoading.value = true;

      // Check if the email is already in use
      final emailExists = await _auth.fetchSignInMethodsForEmail(email);
      if (emailExists.isNotEmpty) {
        errorMessage.value = 'Email is already in use';
        return false;
      }

      // Create the user
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = userCredential.user?.uid;
      if (uid != null) {
        // Save the user details to Firestore
        await _firestore.collection('tripusers').doc(uid).set({
          'uid': uid,
          'username': username,
          'email': email,
          'contact': contact,
          'role': role,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      return true;
    } on FirebaseAuthException catch (e) {
      errorMessage.value = e.message ?? 'Signup failed';
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      errorMessage.value = 'Email and Password cannot be empty';
      return false;
    }

    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
        .hasMatch(email)) {
      errorMessage.value = 'Please enter a valid email address';
      return false;
    }

    if (password.length < 6) {
      errorMessage.value = 'Password must be at least 6 characters long';
      return false;
    }

    try {
      isLoading.value = true;

      // Perform login
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = userCredential.user?.uid;
      if (uid == null) {
        errorMessage.value = 'User ID is null';
        return false;
      }

      final doc = await _firestore.collection('tripusers').doc(uid).get();
      if (!doc.exists) {
        errorMessage.value = 'User data not found in database';
        return false;
      }

      return true;
    } on FirebaseAuthException catch (e) {
      errorMessage.value = e.message ?? 'Login failed';
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
