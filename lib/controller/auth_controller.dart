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

    try {
      isLoading.value = true;

      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = userCredential.user?.uid;
      if (uid != null) {
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
    try {
      isLoading.value = true;

      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = userCredential.user?.uid;
      if (uid == null) {
        throw FirebaseAuthException(
            code: 'no-user', message: 'User ID is null');
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
