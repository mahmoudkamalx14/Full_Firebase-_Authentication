import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_auth_state.freezed.dart';

@freezed
class SocialAuthState<T> with _$SocialAuthState {
  const factory SocialAuthState.initial() = _Initial;

  const factory SocialAuthState.loading() = Loading;

  const factory SocialAuthState.error(String message) = Error;

  const factory SocialAuthState.successLoginGoogle(T data) =
      SuccessLoginGoogle<T>;

  const factory SocialAuthState.successLoginFacebook(T data) =
      SuccessLoginFacebook<T>;
}
