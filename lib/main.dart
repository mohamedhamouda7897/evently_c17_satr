import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently_c17_str/core/my_theme_data.dart';
import 'package:evently_c17_str/providers/auth_provider.dart';
import 'package:evently_c17_str/providers/theme_provider.dart';
import 'package:evently_c17_str/screens/add_event/add_event_screen.dart';
import 'package:evently_c17_str/screens/auth/forget_password.dart';
import 'package:evently_c17_str/screens/auth/login.dart';
import 'package:evently_c17_str/screens/auth/register.dart';
import 'package:evently_c17_str/screens/onboarding/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // FirebaseFirestore.instance.disableNetwork();
  runApp(
    EasyLocalization(
      supportedLocales: [const Locale('en', 'US'), const Locale('ar', 'EG')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => AuthProvider()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var authProvider = Provider.of<AuthProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: themeProvider.themeMode,
      debugShowCheckedModeBanner: false,
      initialRoute: authProvider.firebaseUser != null
          ? HomeScreen.routeName
          : LoginScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        ForgetPasswordScreen.routeName: (context) =>
            const ForgetPasswordScreen(),
        AddEventScreen.routeName: (context) => AddEventScreen(),
      },
    );
  }
}
