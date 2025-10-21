import 'package:darcom_app/feature/auth/view/forgot_password_view.dart';
import 'package:darcom_app/feature/auth/view/sign_in.dart';
import 'package:darcom_app/feature/auth/view/register_view.dart';
import 'package:darcom_app/feature/home/view/category_view.dart';
import 'package:darcom_app/feature/home/view/home_view.dart';
import 'package:darcom_app/feature/home/view/search_view.dart';
import 'package:darcom_app/feature/navigation/view/navigation_view.dart';
import 'package:darcom_app/feature/onboarding/presentation/view/on_boarding_view.dart';
import 'package:darcom_app/feature/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoute {
  static const String onboardingView = '/OnboardingView';
  static const String forgotPasswordView = '/ForgotPasswordView';
  static const String signInView = '/SignInView';
  static const String signUpView = '/SignUpView';
  static const String homeView = '/HomeView';
  static const String navigationView = '/NavigationView';
  static const String searchView = '/SearchView';
  static const String categoryView = '/CategoryView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(
        path: forgotPasswordView,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: navigationView,
        builder: (context, state) => NavigationView(),
      ),
      GoRoute(
        path: signInView,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: signUpView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: onboardingView,
        builder: (context, state) => OnBoardingView(),
      ),
      GoRoute(
        path: searchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(path: categoryView, builder: (context, state) => CategoryView()),
      GoRoute(path: homeView, builder: (context, state) => HomeView()),
    ],
  );
}
