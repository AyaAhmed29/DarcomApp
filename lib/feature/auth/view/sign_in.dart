import 'package:darcom_app/core/helper/app_pop_up.dart';
import 'package:darcom_app/core/utils/app_route.dart';
import 'package:darcom_app/feature/auth/cubit/login_cubit/login_cubit.dart';
import 'package:darcom_app/feature/auth/cubit/login_cubit/login_state.dart';
import 'package:darcom_app/feature/auth/data/repos/auth_repo.dart';
import 'package:darcom_app/feature/auth/view/widgets/auth_template.dart';
import 'package:darcom_app/feature/auth/view/widgets/custom_login_form.dart';
import 'package:darcom_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(AuthRepo()),
      child: Builder(
        builder: (context) {
          return BlocConsumer<SignInCubit, SignInState>(
            listener: (context, state) {
              if (state is SignInFailure) {
                AppPopUp.showSnackBar(
                  context: context,
                  text: state.errorMessage,
                );
              }
              if (state is SignInSuccess) {
                AppPopUp.showSnackBar(
                  context: context,
                  text: S.of(context).logOutSuccessfully,
                );

                AppRoute.router.go(AppRoute.homeView, extra: state.user);
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is SignInLoading,
                child: Scaffold(
                  body: AuthTemplate(
                    authPromptOnPressed: () {
                      AppRoute.router.push(AppRoute.signUpView);
                    },
                    form: CustomLoginForm(),
                    title: S.of(context).welcomeBack,
                    subtitle: S.of(context).signInToContinue,
                    // buttonText: S.of(context).login,
                    authPromptText: S.of(context).DontHaveAnAccount,
                    authPromptButtonText: S.of(context).register,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
