import 'package:flutter/material.dart';
import 'package:todo_app2/core/styles.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: Divider(
              color: Styles.divider,
              height: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'or',
              style: Styles.onBoardingBody
                  .copyWith(color: const Color(0xff5D5D5D)),
            ),
          ),
          const Expanded(
            child: Divider(
              color: Styles.divider,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
