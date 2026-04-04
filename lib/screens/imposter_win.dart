import 'package:flutter/material.dart';
import 'package:impostor/components/backgraund_sreen.dart';
import 'package:impostor/components/custom_button_text.dart';
import 'package:impostor/components/game_result_details.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/providers/provider.dart';
import 'package:provider/provider.dart';

class ImposterWin extends StatelessWidget {
  const ImposterWin({super.key});

  @override
  Widget build(BuildContext context) {
    final GameSessionProvider gameSessionProvider = context
        .watch<GameSessionProvider>();
    return BackgraundScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 90,
                          height: 90,

                          decoration: BoxDecoration(
                            color: const Color.fromARGB(75, 32, 11, 139),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: warningText, width: 2),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 80,

                          decoration: BoxDecoration(
                            color: const Color.fromARGB(76, 55, 19, 236),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: warningText, width: 2),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/images/winner.png',
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "¡El impostor ",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          "ganó!",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                            color: purple,
                          ),
                        ),
                      ],
                    ),
                    Text("Lograron pasar desapercibidos"),
                    SizedBox(height: 30),
                    GameResultDetails(gameSessionProvider: gameSessionProvider),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
