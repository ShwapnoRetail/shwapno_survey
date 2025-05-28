import 'package:flutter/material.dart';
import 'package:shwapno_survey/Style/style.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                Text("Joint With US!", style: Head1Text(colorDarkBlue)),
                SizedBox(height: 10),
                TextFormField(
                  decoration: AppInputDecoration("Enter Your Name"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: AppInputDecoration("Enter Phone Number"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: AppInputDecoration("Enter Mail Address"),
                ),
                SizedBox(height: 20),
                TextFormField(decoration: AppInputDecoration("Enter Staff ID")),
                SizedBox(height: 20),
                TextFormField(
                  decoration: AppInputDecoration("Enter Designation"),
                ),
                SizedBox(height: 20),
                TextFormField(decoration: AppInputDecoration("Enter Password")),
                SizedBox(height: 20),
                Container(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: AppButtonStyle(),
                    child: SuccessButtonChild("Register"),
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
