import 'package:flutter/material.dart';
import 'package:todo_app2/modules/auth/sign_in/widget/sign_in_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  final String route = 'SignInPage';


  @override
  Widget build(BuildContext context) {
    return const SignInWidget();
  }
}