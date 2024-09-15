import 'dart:developer';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app2/models/user_model.dart';
import 'package:todo_app2/modules/home/layout/screen/layout_screen.dart';
import 'package:todo_app2/services/firebase/firebase_functions.dart';

class AuthinticationProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController name = TextEditingController();
  UserModel? user;

  void createUser(BuildContext context) async {
    UserCredential? credential = await FirebaseFunctions.createUser(
        emailController.text, passController.text, name.text);
    if (credential!.user != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, LayoutScreen().routeName);
    } else {
      CherryToast.error(
        title: const Text(
          'Something Went Wrong',
          style: TextStyle(fontSize: 18),
        ),
        // ignore: use_build_context_synchronously
      ).show(context);
    }
    notifyListeners();
  }

  void signUser(BuildContext context) async {
    UserCredential? credential = await FirebaseFunctions.signUser(
        emailController.text, passController.text);
    if (credential!.user != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, LayoutScreen().routeName);
      log('push done');
    } else {
      CherryToast.error(
        title: const Text(
          'Something Went Wrong',
          style: TextStyle(fontSize: 18),
        ),
        // ignore: use_build_context_synchronously
      ).show(context);
      log('error');
    }
    notifyListeners();
  }
  
}
