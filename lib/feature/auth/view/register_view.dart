import 'package:darcom_app/core/helper/app_pop_up.dart';
import 'package:darcom_app/core/utils/app_route.dart';
import 'package:darcom_app/feature/auth/cubit/register_cubit/register_cubit.dart';
import 'package:darcom_app/feature/auth/cubit/register_cubit/register_state.dart';
import 'package:darcom_app/feature/auth/view/widgets/auth_template.dart';
import 'package:darcom_app/feature/auth/view/widgets/custom_register_form.dart';
import 'package:darcom_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Builder(
        builder: (context) {
          return BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
              if (state is RegisterSuccess) {
                AppPopUp.showSnackBar(
                  context: context,
                  text: S
                      .of(context)
                      .registerSuccessfully, // Replace with the correct getter name from your S class
                );

                AppRoute.router.go(AppRoute.homeView, extra: state.user);
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is RegisterLoading ? true : false,
                child: Scaffold(
                  body: AuthTemplate(
                    form: CustomRegisterForm(),
                    title: S.of(context).createAccount,
                    subtitle: S.of(context).Joinus,
                    // buttonText: S.of(context).register,
                    authPromptText: S.of(context).AlreadyHaveAnAccount,
                    authPromptButtonText: S.of(context).login,
                    authPromptOnPressed: () {
                      GoRouter.of(context).push(AppRoute.signInView);
                    },
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
