import 'package:flutter/material.dart';
import 'package:impostor/styles/app_styles.dart';
import '../components/header_actions.dart';
import '../components/title_section.dart';
import '../components/logo_circle.dart';
import '../components/primary_button.dart';
import '../components/secondary_button.dart';
import '../components/social_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const HeaderActions(),
                const SizedBox(height: 40),
                const TitleSection(),
                const SizedBox(height: 50),
                const LogoCircle(),
                const SizedBox(height: 30),
                PrimaryButton(onTap: () {}),
                const SizedBox(height: 15),
                SecondaryButton(onTap: () {}),
                const SizedBox(height: 30),
                SocialSection(width: size.width),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}