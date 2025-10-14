import 'package:darcom_app/feature/auth/cubit/login_cubit/login_state.dart';
import 'package:darcom_app/feature/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(Loginitial());

  final AuthRepo authRepo;
  static SignInCubit get(context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool passwordSecure = true;

  void changePasswordVisibility() {
    passwordSecure = !passwordSecure;
    emit(ChangePasswordState());
  }

  onLoginPressed() async {
    if (!formKey.currentState!.validate()) return;
    emit(SignInLoading());
    var loginResponse = await authRepo.login(
      email: emailController.text,
      password: passwordController.text,
    );

    loginResponse.fold(
      (error) => emit(SignInFailure(error)),
      (userModel) => emit(SignInSuccess(userModel)),
    );
  }
}
