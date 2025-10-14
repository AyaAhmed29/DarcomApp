import 'package:darcom_app/core/helper/app_validator.dart';
import 'package:darcom_app/core/utils/app_images.dart';
import 'package:darcom_app/core/utils/app_padding.dart';
import 'package:darcom_app/core/widgets/custom_button.dart';
import 'package:darcom_app/feature/auth/view/widgets/auth_template.dart';
import 'package:darcom_app/feature/auth/view/widgets/custom_text_field.dart';
import 'package:darcom_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthTemplate(
        form: ForgotForm(),
        title: S.of(context).forgotPassword,
        subtitle: S.of(context).ForgotPasswordMassage,
        // buttonText: S.of(context).sendresetLink,
        authPromptText: '',
        authPromptButtonText: S.of(context).BacktoLogin,
        authPromptOnPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class ForgotForm extends StatelessWidget {
  const ForgotForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          validator: (value) {
            return AppValidator.emailValidator(context: context, value: value);
          },
          controller: null,
          text: S.of(context).email,
          icon: Assets.imagesIconsEmail,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: AppPadding.horizontal29,
          child: CustomButton(text: S.of(context).sendresetLink, ontap: () {}),
        ),
      ],
    );
  }
}
