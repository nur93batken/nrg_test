import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../features.dart';

class AuthDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  final GoogleSignIn _googleSignIn;

  AuthDataSource(this._firebaseAuth, this._firestore, this._googleSignIn);

  Future<void> saveUserToFirestore(AppUser appUser) async {
    await _firestore.collection('users').doc(appUser.uid).set(appUser.toJson());
  }

  Future<AppUser> signUp(String email, String password, String username) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final appUser = AppUser(
      uid: userCredential.user!.uid,
      email: email,
      displayName: username,
      photoURL: '',
      role: 'user',
      phonenumber: '',
    );

    await saveUserToFirestore(appUser);

    return appUser;
  }

  Future<AppUser> signIn(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user == null) {
        throw Exception('No user found');
      }

      return AppUser(
        uid: user.uid,
        email: user.email ?? '',
        role: 'user',
      );
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }

  Future<AppUser> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        throw Exception('Google Sign-In canceled');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      final user = userCredential.user;

      if (user == null) {
        throw Exception('Failed to sign in with Google');
      }

      // AppUser түзүү
      final appUser = AppUser(
        uid: user.uid,
        email: user.email ?? '',
        displayName: '',
        photoURL: user.photoURL ?? '',
        role: 'user',
      );

      // Firestore'го сактоо
      final userDoc =
          await _firestore.collection('users').doc(appUser.uid).get();
      if (!userDoc.exists) {
        await saveUserToFirestore(appUser);
      }

      return appUser;
    } catch (e) {
      throw Exception('Google Sign-In failed: $e');
    }
  }
}
