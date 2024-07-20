import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_firebase_authentication/authentication/data/repository/social_auth_repository.dart';
import 'package:full_firebase_authentication/authentication/logic/social/social_auth_state.dart';

class SocialAuthCubit extends Cubit<SocialAuthState> {
  final SocialAuthRepository _repository;

  SocialAuthCubit(this._repository) : super(const SocialAuthState.initial());

  static SocialAuthCubit get(context) => BlocProvider.of(context);

  void emitGoogleLoginStates() async {
    emit(const SocialAuthState.loading());

    final response = await _repository.signInWithGoogle();

    response.when(
      success: (data) {
        emit(SocialAuthState.successLoginGoogle(data));
      },
      failure: (error) {
        emit(SocialAuthState.error(error));
      },
    );
  }

  void emitFacebookLoginStates() async {
    emit(const SocialAuthState.loading());

    final response = await _repository.signInWithFacebook();

    response.when(
      success: (data) {
        emit(SocialAuthState.successLoginFacebook(data));
      },
      failure: (error) {
        emit(SocialAuthState.error(error));
      },
    );
  }
}
