import 'package:darcom_app/core/helper/app_validator.dart';
import 'package:darcom_app/core/utils/app_images.dart';
import 'package:darcom_app/core/utils/app_padding.dart';
import 'package:darcom_app/core/widgets/custom_button.dart';
import 'package:darcom_app/feature/auth/cubit/register_cubit/register_cubit.dart';
import 'package:darcom_app/feature/auth/cubit/register_cubit/register_state.dart';
import 'package:darcom_app/feature/auth/view/widgets/custom_text_field.dart';
import 'package:darcom_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomRegisterForm extends StatelessWidget {
  const CustomRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: RegisterCubit.get(context).formKey,
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              CustomTextField(
                validator: (value) {
                  return AppValidator.emailValidator(
                    context: context,
                    value: value,
                  );
                },
                controller: RegisterCubit.get(context).emailController,
                text: S.of(context).email,
                icon: Assets.imagesIconsEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextField(
                validator: (value) {
                  return AppValidator.usernameValidator(value);
                },
                controller: RegisterCubit.get(context).usernameController,
                text: S.of(context).fullName,
                icon: Assets.imagesIconsUser,
                keyboardType: TextInputType.name,
              ),
              BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      CustomTextField(
                        validator: (value) {
                          return AppValidator.passwordValidator(value);
                        },
                        obscureText: RegisterCubit.get(context).passwordSecure,
                        controller: RegisterCubit.get(
                          context,
                        ).passwordController,
                        text: S.of(context).password,
                        icon: Assets.imagesIconsLock,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIconOnPressed: () {
                          RegisterCubit.get(context).changePasswordVisibility();
                        },
                        suffixIcon: RegisterCubit.get(context).passwordSecure
                            ? Assets.imagesIconsCloseEye
                            : Assets.imagesIconsEye,
                      ),
                      CustomTextField(
                        controller: RegisterCubit.get(
                          context,
                        ).confirmPasswordController,
                        validator: (value) {
                          return AppValidator.confirmPasswordValidator(
                            password: RegisterCubit.get(
                              context,
                            ).passwordController.text,
                            value: value,
                          );
                        },
                        text: S.of(context).confirmPassword,
                        icon: Assets.imagesIconsLock,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: RegisterCubit.get(
                          context,
                        ).confirmPasswordSecure,
                        suffixIconOnPressed: () {
                          RegisterCubit.get(
                            context,
                          ).changeConfirmPasswordVisibility();
                        },
                        suffixIcon:
                            RegisterCubit.get(context).confirmPasswordSecure
                            ? Assets.imagesIconsCloseEye
                            : Assets.imagesIconsEye,
                      ),
                    ],
                  );
                },
              ),
              Padding(
                padding: AppPadding.horizontal29,
                child: CustomButton(
                  text: S.of(context).register,
                  ontap: () async {
                    RegisterCubit.get(context).onRegisterPressed();
                    GoRouter.of(context).pop();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
