import 'package:darcom_app/feature/auth/data/model/user_model.dart';

abstract class SignInState {}

class Loginitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final UserModel user;
  SignInSuccess(this.user);
}

class SignInFailure extends SignInState {
  final String errorMessage;
  SignInFailure(this.errorMessage);
}

class ChangePasswordState extends SignInState {}
