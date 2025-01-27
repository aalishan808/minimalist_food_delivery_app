import 'package:firebase_auth/firebase_auth.dart';
class AuthService {
  //get instance of firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //get current user
  User? getCurrentUser()=> _auth.currentUser;

  //sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //Sign up with email and password

  Future<UserCredential> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign out
  Future<void> signOut() async {
   return await _auth.signOut();
  }
    }
