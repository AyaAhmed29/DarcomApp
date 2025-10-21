import 'package:darcom_app/core/utils/app_images.dart';
import 'package:darcom_app/core/utils/app_route.dart';
import 'package:darcom_app/core/utils/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          GoRouter.of(context).go(AppRoute.onboardingView);
        } else {
          GoRouter.of(context).go(AppRoute.navigationView);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.imagesAppIcon, width: 60.w, height: 60.h),
            SizedBox(height: 9.w),
            Text('Darcom', style: AppStyles.semiBold18),
          ],
        ),
      ),
    );
  }
}
