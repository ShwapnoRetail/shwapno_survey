import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwapno_survey/Component/bottonmNav.dart';
import 'package:shwapno_survey/Component/drawer.dart';

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
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: _lightTheme,
          darkTheme: _darkTheme,
          home: const DrawerWidget(),
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
