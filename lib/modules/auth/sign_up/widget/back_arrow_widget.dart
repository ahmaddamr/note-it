import 'package:flutter/material.dart';

class BackArrowWidget extends StatelessWidget {
  const BackArrowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new,
                    color: Colors.grey)),
            Text(
              'back',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        ),
          const SizedBox(
          height: 2,
          child: Divider(
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
