import 'package:firebase_auth/firebase_auth.dart';
import 'package:full_firebase_authentication/authentication/data/models/user_model.dart';

class EmailAuthService {
  final FirebaseAuth firebaseAuth;
  EmailAuthService(this.firebaseAuth);

  Future<void> registerWithEmailAndPassword(UserModel model) async {
    await firebaseAuth.createUserWithEmailAndPassword(
      email: model.email,
      password: model.password,
    );
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  Future<void> resetPasswordWithLink(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
