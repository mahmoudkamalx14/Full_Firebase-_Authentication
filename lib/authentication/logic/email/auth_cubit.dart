import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_firebase_authentication/authentication/data/models/user_model.dart';
import 'package:full_firebase_authentication/authentication/data/repository/auth_repository.dart';
import 'package:full_firebase_authentication/authentication/logic/email/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(const AuthState.initial());

  static AuthCubit get(context) => BlocProvider.of(context);

  void emitLoginStates(String email, String password) async {
    emit(const AuthState.loading());

    final response =
        await _authRepository.signInWithEmailAndPassword(email, password);

    response.when(
      success: (data) {
        emit(AuthState.successLogin(response));
      },
      failure: (errorHandler) {
        //      emit(AuthState.error(errorHandler));
      },
    );
  }

  void emitRegisterStates(UserModel model) async {
    emit(const AuthState.loading());

    final response = await _authRepository.registerWithEmailAndPassword(model);

    response.when(
      success: (data) {
        emit(AuthState.successRegister(response));
      },
      failure: (errorHandler) {
        emit(AuthState.error(errorHandler));
      },
    );
  }

  void emitResetPasswordStates(String email) async {
    final response = await _authRepository.resetPassword(email);

    response.when(
      success: (data) {
        emit(AuthState.successResetPassword(response));
      },
      failure: (errorHandler) {
        emit(AuthState.error(errorHandler));
      },
    );
  }

  void emitSignOutStates() async {
    final response = await _authRepository.signOut();
    response.when(
      success: (data) {
        emit(AuthState.successSignOut(response));
      },
      failure: (errorHandler) {
        emit(AuthState.error(errorHandler));
      },
    );
  }
}
