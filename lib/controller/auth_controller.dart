import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  /// Updated signup function
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

      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = userCredential.user?.uid;
      if (uid != null) {
        await _firestore.collection('tripusers').doc(uid).set({
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

  /// Login only allows 'user' role
  Future<bool> login(String email, String password) async {
    try {
      isLoading.value = true;

      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = userCredential.user?.uid;
      final userDoc = await _firestore.collection('users').doc(uid).get();
      final role = userDoc.data()?['role'];

      if (role != 'user') {
        await _auth.signOut();
        errorMessage.value = 'This is not a user account';
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

  Future<void> logout() async {
    await _auth.signOut();
  }
}
