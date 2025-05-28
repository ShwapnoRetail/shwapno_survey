import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwapno_survey/Component/splashScreen.dart';
import 'package:shwapno_survey/Screen/Auth/forgetPassword.dart';
import 'package:shwapno_survey/Screen/Auth/otpVerify.dart';
import 'package:shwapno_survey/Screen/Auth/resetPass.dart';
import 'package:shwapno_survey/Screen/Auth/signIn.dart';
import 'package:shwapno_survey/Screen/Auth/signUp.dart';
import 'package:shwapno_survey/Screen/Dashboard/dashboardScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: "Survey App",
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: _lightTheme,
          darkTheme: _darkTheme,
          initialRoute: '/',
          routes: {
            '/': (context) => SplashScreen(),
            '/dashboard': (context) => const DashboardScreen(),
            '/login': (context) => LoginScreen(),
            '/registration': (context) => SignUpScreen(),
            '/otpVerfication': (context) => OtpVerificationScreen(),
            '/resetPassword': (context) => ResetPasswordScreen(),
            '/forgetPassword': (context) => ForgetPasswordScreen(),
          },
        );
      },
    );
  }
}

// Light Theme
final ThemeData _lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFFF5F5F5),
  primaryColor: Colors.teal,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.teal.shade600,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(fontSize: 16.sp, color: Colors.black87),
    bodyMedium: TextStyle(fontSize: 14.sp, color: Colors.black54),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      textStyle: TextStyle(fontSize: 16.sp),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
    ),
  ),
);

// Dark Theme
final ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFF1E1E1E),
  primaryColor: Colors.tealAccent,
  colorScheme: ColorScheme.dark(
    primary: Colors.tealAccent,
    secondary: Colors.cyanAccent,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black87,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(fontSize: 16.sp, color: Colors.white),
    bodyMedium: TextStyle(fontSize: 14.sp, color: Colors.white70),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.tealAccent.shade700,
      foregroundColor: Colors.black,
      textStyle: TextStyle(fontSize: 16.sp),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
    ),
  ),
);
