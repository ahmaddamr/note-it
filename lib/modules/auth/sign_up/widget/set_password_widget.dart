import 'package:flutter/material.dart';
import 'package:todo_app2/core/styles.dart';
import 'package:todo_app2/modules/auth/sign_up/widget/back_arrow_widget.dart';
import 'package:todo_app2/modules/auth/sign_up/widget/custom_textFormField.dart';
import 'package:todo_app2/modules/home/layout/widget/custom_elevated_button.dart';

class SetPasswordWidget extends StatefulWidget {
  const SetPasswordWidget({super.key});

  @override
  State<SetPasswordWidget> createState() => _SetPasswordWidgetState();
}

class _SetPasswordWidgetState extends State<SetPasswordWidget> {
  GlobalKey<FormState> formKey = GlobalKey();

  String? password;

  bool isSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const BackArrowWidget(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Set password',
                          style: Styles.SignStyle,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.020,
                        ),
                        const Text(
                          'Password',
                          style: Styles.textFieldStyle,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.011,
                        ),
                        CustomTextFormField(
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
                          height: MediaQuery.of(context).size.height * 0.050,
                        ),
                        const Text(
                          'Confirm Password',
                          style: Styles.textFieldStyle,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.011,
                        ),
                        CustomTextFormField(
                          suffixIcon: passwordShow(),
                          obscureText: isSecurePassword,
                          onSaved: (p0) {
                            password = p0;
                          },
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
                          height: MediaQuery.of(context).size.height * 0.020,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                        CustomElvatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              print('valid');
                            } else {
                              print('not valid');
                            }
                          },
                          text: 'Next',
                          backgroundColor: Styles.primary,
                          borderSideColor: Colors.transparent,
                          style:
                              Styles.ButtonsStyle.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
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
          style: Styles.ButtonsStyle.copyWith(fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
