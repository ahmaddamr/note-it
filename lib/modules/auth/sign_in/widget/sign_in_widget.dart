import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app2/core/styles.dart';
import 'package:todo_app2/manager/provider/auth_provider.dart';
import 'package:todo_app2/modules/auth/sign_up/page/sign_up_page.dart';
import 'package:todo_app2/modules/auth/sign_up/widget/custom_textFormField.dart';
import 'package:todo_app2/modules/home/layout/widget/custom_elevated_button.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

bool isSecurePassword = false;
GlobalKey<FormState> formKey = GlobalKey();

class _SignInWidgetState extends State<SignInWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthinticationProvider(),
      child: Consumer<AuthinticationProvider>(
        builder: (context, provider, child) {
          return SafeArea(
            child: Scaffold(
              body: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // const BackArrowWidget(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'singin'.tr(),
                              style: Styles.SignStyle.copyWith(
                                  color: Colors.blue),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.020,
                            ),
                            Text(
                              'Email',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.011,
                            ),
                            CustomTextFormField(
                                controller: provider.emailController,
                                obscureText: false,
                                hint: 'Example@example.com',
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'field is empty';
                                  }
                                  return null;
                                }),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.020,
                            ),
                            Text(
                              'password',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.011,
                            ),
                            CustomTextFormField(
                              controller: provider.passController,
                              suffixIcon: passwordShow(),
                              obscureText: isSecurePassword,
                              hint: 'ass-hh1',
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'field is empty';
                                }
                                if (val.length < 7) {
                                  return 'password must contain al least 7 letters';
                                }
                                if (!RegExp(r'(?=.*[A-Z])').hasMatch(val)) {
                                  return 'Password must contain at least one capital letter.';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.020,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'forget'.tr(),
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.020,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'By contuinung you agree to our ',
                                  style: Styles.policy,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'Terms of Service ',
                                    style: Styles.policy
                                        .copyWith(color: Colors.blue),
                                  ),
                                ),
                                const Text(
                                  '&',
                                  style: Styles.policy,
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Privcay Policy',
                                style: Styles.policy
                                    .copyWith(color: Colors.blue),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.020,
                            ),
                            CustomElvatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  // ignore: avoid_print
                                  print('valid');
                                  provider.signUser(context);
                                  log('valid2');
                                }
                              },
                              text: 'Continue',
                              backgroundColor: Colors.blue,
                              borderSideColor: Colors.transparent,
                              style: Theme.of(context).textTheme.bodyLarge!,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.020,
                            ),
                            CustomElvatedButton(
                              onPressed: () {},
                              text: 'Log in as a guest',
                              backgroundColor: Colors.white,
                              borderSideColor: Colors.grey,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: Colors.grey),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                            // const CustomDivider(),
                            // SizedBox(
                            //   height: MediaQuery.of(context).size.height * 0.015,
                            // ),
                            // CustomIconButton(
                            //   onPressed: () {},
                            //   icon: 'assets/icons/google_icon.svg',
                            //   text: 'Continue with Google',
                            // ),
                            // SizedBox(
                            //   height: MediaQuery.of(context).size.height * 0.015,
                            // ),
                            // CustomIconButton(
                            //   onPressed: () {},
                            //   icon: 'assets/icons/facebook_icon.svg',
                            //   text: 'Continue with Facebook',
                            // ),
                            // SizedBox(
                            //   height: MediaQuery.of(context).size.height * 0.015,
                            // ),
                            // CustomIconButton(
                            //   onPressed: () {},
                            //   icon: 'assets/icons/apple_icon.svg',
                            //   text: 'Continue with Apple',
                            // ),
                            // SizedBox(
                            //   height: MediaQuery.of(context).size.height * 0.025,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'or ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: const Color(0xff3D3D3D)),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, const SignUpPage().route);
                                  },
                                  child: Text(
                                    ' sign up',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget passwordShow() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSecurePassword = !isSecurePassword;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
        child: Text(
          isSecurePassword ? 'Show' : 'Hide',
          style: Styles.ButtonsStyle.copyWith(
              fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
    );
  }
}
