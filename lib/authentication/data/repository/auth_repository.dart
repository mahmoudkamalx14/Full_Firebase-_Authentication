import 'package:full_firebase_authentication/authentication/data/models/user_model.dart';
import 'package:full_firebase_authentication/authentication/data/services/email_auth_service.dart';
import 'package:full_firebase_authentication/authentication/data/services/firestore_service.dart';
import 'package:full_firebase_authentication/core/networking/firebase_result.dart';

class AuthRepository {
  final EmailAuthService _authService;
  final FirestoreService _firestoreService;

  AuthRepository(this._authService, this._firestoreService);

  Future<FirebaseResult<void>> registerWithEmailAndPassword(
      UserModel model) async {
    try {
      final response = await _authService.registerWithEmailAndPassword(model);

      addUserProfileToDatabase(model);

      _authService.verifyEmail();

      return FirebaseResult.success(response);
    } catch (e) {
      return const FirebaseResult.failure('Something went wrong');
    }
  }

  Future<FirebaseResult<void>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final response =
          await _authService.signInWithEmailAndPassword(email, password);

      return FirebaseResult.success(response);
    } catch (e) {
      return const FirebaseResult.failure('Something went wrong');
    }
  }

  Future<FirebaseResult> addUserProfileToDatabase(UserModel model) async {
    try {
      final response = await _firestoreService
          .addUserProfileToDatabase(model)
          .then((value) {});

      return FirebaseResult.success(response);
    } catch (e) {
      return const FirebaseResult.failure('Something went wrong');
    }
  }

  Future<FirebaseResult<void>> resetPassword(String email) async {
    try {
      final response = await _authService.resetPasswordWithLink(email);

      return FirebaseResult.success(response);
    } catch (e) {
      return const FirebaseResult.failure('Something went wrong');
    }
  }

  Future<FirebaseResult<void>> signOut() async {
    try {
      final response = await _authService.signOut();

      return FirebaseResult.success(response);
    } catch (e) {
      return const FirebaseResult.failure('Something went wrong');
    }
  }
}
