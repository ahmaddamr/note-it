import 'dart:developer';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app2/core/theme/apptheme.dart';
import 'package:todo_app2/manager/provider/main_provider.dart';
import 'package:todo_app2/modules/auth/sign_in/page/sign_in_page.dart';
import 'package:todo_app2/modules/home/settings/widget/profile_settings_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  // bool isLocal = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MainProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('settings'.tr()),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              log('signed Out');
              CherryToast.info(
                title: const Text(
                  'you have Signed out',
                  style: TextStyle(fontSize: 18),
                ),
              ).show(context);
              Navigator.pushReplacementNamed(context, const SignInPage().route);
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CircleAvatar(
                      radius: 39,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 35,
                          child: Icon(
                            Icons.person,
                            size: 40,
                          )),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          provider.user?.name ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 25),
                        ),
                        Text(
                          provider.user?.email ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 20, fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    showDragHandle: true,
                    context: context,
                    builder: (context) {
                      return Scaffold(
                        body: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Select a Language:',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  context.setLocale(const Locale('ar'));
                                },
                                child: Text(
                                  'Arabic',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  context.setLocale(const Locale('en'));
                                },
                                child: Text(
                                  'English',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                child: ProfileSettingsItem(
                  img: 'https://cdn-icons-png.flaticon.com/128/888/888878.png',
                  txt: 'languages'.tr(),
                ),
              ),
              // SwitchListTile(
              //   title: const Row(
              //     children: [
              //       Text('Theme'),
              //     ],
              //   ),
              //   value: provider.Theme,
              //   onChanged: (value) {
              //     provider.changeTheme(provider.themeMode, value);
              //   },
              // )
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Scaffold(
                        body: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () async{
                                  var provider = Provider.of<MainProvider>(
                                      context,
                                      listen: false);
                                await  provider.changetheme(AppTheme().darkTheme);
                                  log('change');
                                },
                                child: Text(
                                  'Dark',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () async{
                                  var provider = Provider.of<MainProvider>(
                                      context,
                                      listen: false);
                                  await provider.changetheme(AppTheme().lightTheme);

                                },
                                child: Text(
                                  'Light',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                child: ProfileSettingsItem(
                    img:
                        'https://cdn-icons-png.flaticon.com/128/12180/12180682.png',
                    txt: 'theme'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
