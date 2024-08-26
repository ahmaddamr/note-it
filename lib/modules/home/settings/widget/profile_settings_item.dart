import 'package:flutter/material.dart';

class ProfileSettingsItem extends StatelessWidget {
  ProfileSettingsItem(
      {super.key, required this.img, required this.txt, this.onTap});
  final String img;
  final String txt;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.network(
              img,
              width: 40,
              height: 40,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              txt,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 20, fontWeight: FontWeight.normal),
            ),
            const Spacer(
              flex: 1,
            ),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
