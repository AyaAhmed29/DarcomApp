import 'package:darcom_app/core/helper/app_validator.dart';
import 'package:darcom_app/core/utils/app_images.dart';
import 'package:darcom_app/core/utils/app_padding.dart';
import 'package:darcom_app/core/utils/app_route.dart';
import 'package:darcom_app/core/utils/app_styles.dart';
import 'package:darcom_app/core/widgets/custom_button.dart';
import 'package:darcom_app/feature/auth/cubit/login_cubit/login_cubit.dart';
import 'package:darcom_app/feature/auth/cubit/login_cubit/login_state.dart';
import 'package:darcom_app/feature/auth/view/widgets/custom_text_field.dart';
import 'package:darcom_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: SignInCubit.get(context).formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            validator: (value) =>
                AppValidator.emailValidator(context: context, value: value),
            text: S.of(context).email,
            icon: Assets.imagesIconsEmail,
            keyboardType: TextInputType.emailAddress,

            controller: SignInCubit.get(context).emailController,
          ),
          // SizedBox(height: 20.h),
          BlocBuilder<SignInCubit, SignInState>(
            builder: (context, state) {
              return CustomTextField(
                validator: (value) => AppValidator.passwordValidator(value),
                obscureText: SignInCubit.get(context).passwordSecure,
                text: S.of(context).password,
                icon: Assets.imagesIconsLock,
                keyboardType: TextInputType.visiblePassword,
                suffixIconOnPressed: SignInCubit.get(
                  context,
                ).changePasswordVisibility,
                suffixIcon: SignInCubit.get(context).passwordSecure
                    ? Assets.imagesIconsCloseEye
                    : Assets.imagesIconsEye,
                controller: SignInCubit.get(context).passwordController,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextButton(
              onPressed: () {
                AppRoute.router.push(AppRoute.forgotPasswordView);
              },
              child: Text(
                S.of(context).forgotPassword,
                style: AppStyles.regular13,
              ),
            ),
          ),
          Padding(
            padding: AppPadding.horizontal16vertical8,
            child: CustomButton(
              text: S.of(context).login,
              ontap: () {
                SignInCubit.get(context).onLoginPressed();
              },
            ),
          ),
        ],
      ),
    );
  }
}
