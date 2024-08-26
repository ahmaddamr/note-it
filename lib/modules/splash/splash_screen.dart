import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app2/modules/auth/sign_up/page/sign_up_page.dart';
import 'package:todo_app2/modules/home/layout/screen/layout_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  final String routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (FirebaseAuth.instance.currentUser != null) {
          Navigator.pushReplacementNamed(context, LayoutScreen().routeName);
        } else {
          Navigator.pushReplacementNamed(context, const SignUpPage().route);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
