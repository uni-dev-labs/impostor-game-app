import 'package:flutter/material.dart';
 
class PrivacyNotice extends StatelessWidget {
  const PrivacyNotice({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.info_outline,
          size: 13,
          color: Colors.white.withOpacity(0.35),
        ),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            'Asegúrate de que nadie más esté mirando la pantalla antes de tocar.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.35),
              fontSize: 12,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
 