import 'package:flutter/material.dart';
import 'package:todo_app2/modules/auth/sign_up/widget/sign_up_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  final String route = 'SignUpPage';

  @override
  Widget build(BuildContext context) {
    return const SignUpWidget();
  }
}