
import 'package:my_gallery/data/models/login/LoginResponse.dart';

sealed class LoginViewModelState {}

final class LoginViewModelInitial extends LoginViewModelState {}

final class LoginViewModeLoading extends LoginViewModelState {}

final class LoginViewModeSuccess extends LoginViewModelState {
  LoginResponse loginResponse;
  LoginViewModeSuccess(this.loginResponse);
}

final class LoginViewModeError extends LoginViewModelState {
  String error;
  LoginViewModeError(this.error);
}
