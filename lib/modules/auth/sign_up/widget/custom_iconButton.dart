import 'package:flutter/material.dart';
import 'package:todo_app2/core/styles.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.onPressed});
  final String icon;
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 400,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.5,
          backgroundColor: Styles.greyButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              // child: SvgPicture.asset(
              //   icon,
              //   width: 26,
              //   height: 26,
              // ),
            ),
            const SizedBox(width: 40), // Adjust spacing as needed
            Text(
              text,
              style: Styles.ButtonsStyle.copyWith(
                color: const Color(0xff3D3D3D),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
