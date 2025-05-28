import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shwapno_survey/Style/style.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            padding: EdgeInsets.all(30),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("OTP Verification", style: Head1Text(colorDarkBlue)),
                SizedBox(height: 15),
                Text(
                  "A digit pin has been sent your mobile phone number",
                  style: Head6Text(colorLightGray),
                ),
                SizedBox(height: 20),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  pinTheme: AppOTPStyle(),
                  animationType: AnimationType.fade,
                  animationDuration: Duration(microseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (v) {},
                  onChanged: (value) => {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
