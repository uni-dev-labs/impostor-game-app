import 'package:flutter/material.dart';

class PlayerCounter extends StatelessWidget {
  final int count;
  final String label;

  const PlayerCounter({
    Key? key,
    required this.count,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          count.toString(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(label),
      ],
    );
  }
}