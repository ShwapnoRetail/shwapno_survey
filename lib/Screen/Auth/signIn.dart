import 'package:flutter/material.dart';
import 'package:shwapno_survey/Style/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                Text("Get Start With", style: Head1Text(colorDarkBlue)),
                SizedBox(height: 1),
                Text("Shwapno", style: Head6Text(colorLightGray)),
                SizedBox(height: 10),
                TextFormField(
                  decoration: AppInputDecoration("Enter Your Phone Number"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: AppInputDecoration("Enter Your Password"),
                ),
                SizedBox(height: 20),
                Container(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: AppButtonStyle(),
                    child: SuccessButtonChild("Login"),
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
