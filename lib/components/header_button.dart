import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button.dart';


class HeaderButtons extends StatelessWidget {
  const HeaderButtons();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CustomButton(icon: Icons.settings),
          CustomButton(icon: Icons.info_outline),
        ],
      ),
    );
  }
}