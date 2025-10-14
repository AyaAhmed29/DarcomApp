// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:talkai/core/utils/app_images.dart';
// import 'package:talkai/core/utils/app_route.dart';

// class SplashView extends StatefulWidget {
//   const SplashView({super.key});

//   @override
//   State<SplashView> createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SplashView>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _animation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1000),
//     )..repeat(reverse: true);

//     _animation = Tween<Offset>(
//       begin: Offset(0, 0),
//       end: Offset(0, -0.25),
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

//     Future.delayed(const Duration(seconds: 5), () {
//       GoRouter.of(context).go(AppRoute.onboardingView);
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: SlideTransition(
//           position: _animation,
//           child: Image.asset(Assets.assetsImagesAppLogo, width: 250),
//         ),
//       ),
//     );
//   }
// }
