import 'package:darcom_app/core/logic/cubit/cubit/toggle_theme_cubit.dart';
import 'package:darcom_app/core/logic/language/toggle_language_cubit.dart';
import 'package:darcom_app/core/utils/app_route.dart';
import 'package:darcom_app/core/utils/app_theme.dart';
import 'package:darcom_app/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:darcom_app/core/utils/local_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await LocalStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ToggleLanguageCubit()),
          BlocProvider(create: (context) => ToggleThemeCubit()),
        ],
        child: BlocBuilder<ToggleThemeCubit, ThemeData>(
          builder: (context, theme) {
            return BlocBuilder<ToggleLanguageCubit, Locale>(
              builder: (context, state) {
                return MaterialApp.router(
                  localizationsDelegates: [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  locale: state,
                  supportedLocales: S.delegate.supportedLocales,

                  routerConfig: AppRoute.router,
                  debugShowCheckedModeBanner: false,
                  // theme: theme,
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                );
              },
            );
          },
        ),
      ), 
    );
  }
}
