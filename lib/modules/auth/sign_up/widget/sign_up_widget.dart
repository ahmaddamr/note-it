// ignore_for_file: avoid_print

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app2/core/styles.dart';
import 'package:todo_app2/manager/provider/auth_provider.dart';
import 'package:todo_app2/modules/auth/sign_in/page/sign_in_page.dart';
import 'package:todo_app2/modules/auth/sign_up/widget/custom_textFormField.dart';
import 'package:todo_app2/modules/home/layout/widget/custom_elevated_button.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

bool isSecurePassword = true;
GlobalKey<FormState> formKey = GlobalKey();
TextEditingController name = TextEditingController();

class _SignUpWidgetState extends State<SignUpWidget> {
  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<AuthinticationProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => AuthinticationProvider(),
      child: SafeArea(
        child: Scaffold(
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Consumer<AuthinticationProvider>(
                builder: (context, provider, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // const BackArrowWidget(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'register'.tr(),
                              style:
                                  Styles.SignStyle.copyWith(color: Colors.blue),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.020,
                            ),
                            const Text(
                              'Name',
                              style: Styles.textFieldStyle,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.011,
                            ),
                            CustomTextFormField(
                                controller: provider.name,
                                obscureText: false,
                                hint: 'Active',
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
                            const Text(
                              'Email',
                              style: Styles.textFieldStyle,
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
                                // if (RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(val)) {
                                //   return 'email is not Correct';
                                // }
                              },
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.020,
                            ),
                            const Text(
                              'password',
                              style: Styles.textFieldStyle,
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
                                style:
                                    Styles.policy.copyWith(color: Colors.blue),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.020,
                            ),
                            CustomElvatedButton(
                              onPressed: () {
                                // appRouter.pushNamed(SetPasswordPage.pageName);
                                if (formKey.currentState!.validate()) {
                                  print('valid');
                                  provider.createUser(context);

                                  print('valid2');
                                }
                              },
                              text: 'Sign Up',
                              backgroundColor: Colors.blue,
                              borderSideColor: Colors.transparent,
                              style: Styles.ButtonsStyle.copyWith(
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.020,
                            ),
                            CustomElvatedButton(
                              onPressed: () {},
                              text: 'Log in as a guest',
                              backgroundColor: Colors.white,
                              borderSideColor: Styles.divider,
                              style: Styles.ButtonsStyle.copyWith(
                                  color: Styles.divider),
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
                                  style: Styles.onBoardingBody
                                      .copyWith(color: const Color(0xff3D3D3D)),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // appRouter.pushReplacementNamed(SignInPage.pageName);
                                    Navigator.pushReplacementNamed(
                                        context, const SignInPage().route);
                                  },
                                  child: Text(
                                    ' Log in',
                                    style: Styles.onBoardingBody.copyWith(
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
                  );
                },
              ),
            ),
          ),
        ),
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
