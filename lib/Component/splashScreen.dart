import 'package:flutter/material.dart';
import 'package:shwapno_survey/Style/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool _textVisible = false;

  @override
  void initState() {
    super.initState();
    // Trigger animation after a short delay
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _textVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.redAccent, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Optional subtle pattern
          Positioned.fill(
            child: Opacity(opacity: 0.05, child: ScreenBackground(context)),
          ),

          // Logo and animated text
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo
                Image.asset("assets/images/shwapno.png", width: 150),

                const SizedBox(height: 20),

                // Animated Text
                AnimatedSlide(
                  duration: const Duration(milliseconds: 500),
                  offset: _textVisible ? Offset.zero : const Offset(0, 0.5),
                  curve: Curves.easeOut,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 600),
                    opacity: _textVisible ? 1 : 0,
                    child: const Text(
                      "Shwapno Survey App",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
