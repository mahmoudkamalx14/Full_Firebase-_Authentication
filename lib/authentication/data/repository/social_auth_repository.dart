import 'package:firebase_auth/firebase_auth.dart';
import 'package:full_firebase_authentication/authentication/data/services/social_auth_service.dart';
import 'package:full_firebase_authentication/core/networking/firebase_result.dart';

class SocialAuthRepository {
  final SocialAuthService _socialAuthService;

  SocialAuthRepository(this._socialAuthService);

  Future<FirebaseResult<UserCredential>> signInWithGoogle() async {
    try {
      final response = await _socialAuthService.signInWithGoogle();

      return FirebaseResult.success(response);
    } catch (error) {
      return FirebaseResult.failure(error.toString());
    }
  }

  Future<FirebaseResult<UserCredential>> signInWithFacebook() async {
    try {
      final response = await _socialAuthService.signInWithFacebook();

      return FirebaseResult.success(response);
    } catch (error) {
      return FirebaseResult.failure(error.toString());
    }
  }
}
