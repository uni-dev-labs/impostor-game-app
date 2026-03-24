import 'package:flutter/material.dart';
import '../components/configuration-usuario-screen/role_header.dart';
import '../components/configuration-usuario-screen/role_badge.dart';
import '../components/configuration-usuario-screen/word_card.dart';
import '../components/configuration-usuario-screen/info_text.dart';
import '../components/configuration-usuario-screen/next_button.dart';

class RolUsuarioPage extends StatelessWidget {
  const RolUsuarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: [Color(0xFF0D1028), Color(0xFF050714)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: const [
                SizedBox(height: 10),
                RoleHeader(),

                /// 🔥 centra todo el contenido
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RoleBadge(),
                        SizedBox(height: 30),
                        WordCard(),
                        SizedBox(height: 25),
                        InfoText(),
                      ],
                    ),
                  ),
                ),

                NextButton(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
