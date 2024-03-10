import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_chat_app/exceptions/auth_exception.dart';
import 'package:sample_chat_app/utils/extensions/stream_extensions.dart';

mixin AuthenticationService {
  /// Current user's sign-in status
  static bool get isSignedIn => FirebaseAuth.instance.currentUser != null;

  /// Current user's sign-in status (Stream)
  static Stream<bool> isSignedInStream() => FirebaseAuth.instance
      .authStateChanges()
      .map((user) => user != null)
      .onlyNotify((p, c) => p != c);

  /// Current user's user ID
  static String? get currentUserID => FirebaseAuth.instance.currentUser?.uid;

  /// Current user's user ID (Stream)
  static Stream<String?> currentUserIDStream() => FirebaseAuth.instance
      .userChanges()
      .map((user) => user?.uid)
      .onlyNotify((p, c) => p != c);

  /// Create a new user with email and password
  static Future<String> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw const AuthException(
          'The account already exists for that email. Please sign in.',
        );
      }
      if (e.code == 'invalid-email') {
        throw const AuthException(
          'The email address is not valid. Please enter a valid email address.',
        );
      }
      if (e.code == 'weak-password') {
        throw const AuthException(
          'The password is too weak. Please choose a stronger password.',
        );
      }
      throw AuthException(e.message ?? '$e');
    }
  }

  /// Sign in with email and password
  static Future<String> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw const AuthException(
          'No user found for that email. Please check the email and try again.',
        );
      }
      if (e.code == 'wrong-password') {
        throw const AuthException(
          'Wrong password. Please check the password and try again.',
        );
      }
      throw AuthException(e.message ?? '$e');
    }
  }

  /// Sign out
  static Future<void> signOut() => FirebaseAuth.instance.signOut();
}
