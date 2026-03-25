import 'package:flutter/material.dart';
import 'package:impostor/core/app_colors.dart';

class RoundPage extends StatelessWidget{
  const RoundPage({super.key});

@override
Widget build(BuildContext context){
  return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _appBar(context),

            ],
          ),
        ),
      ),
  );
}
  Widget _appBar(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: purpleDark,
            radius: 20,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.chevron_left, color: Colors.white, size: 23),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.lock, color: subtitleGray, size: 14),
              const SizedBox(width: 6),
              Text(
                'EL IMPOSTOR',
                style: TextStyle(
                  color: purple,
                  fontSize: 11,
                  letterSpacing: 1.1,
                ),
              ),
            ],
          ),
          Text(
            '',
            style: TextStyle(
              color: subtitleGray,
              fontSize: 11,
              letterSpacing: 1.1,
            ),
          ),
        ],
      ),
    );
  }

}