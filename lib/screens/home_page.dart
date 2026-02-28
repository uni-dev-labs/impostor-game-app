import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../components/custom_button.dart';
import 'configuration_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            children: [
              _buildTopBar(context),
              const Spacer(flex: 2),
              _buildTitle(),
              const Spacer(flex: 2),
              _buildHeroImage(),
              const Spacer(flex: 3),
              PrimaryButton(
                text: 'JUGAR',
                icon: Icons.play_arrow,
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              _buildSecondaryButton(),
              const Spacer(flex: 2),
              _buildFooter(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }



  Widget _buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          icon: Icons.settings,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ConfigurationPage()));
          },
        ),
        CustomIconButton(
          icon: Icons.info_outline,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return const Column(
      children: [
        Text('EL', style: TextStyle(color: AppColors.white, fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 2)),
        Text('IMPOSTOR', style: TextStyle(color: AppColors.white, fontSize: 48, fontWeight: FontWeight.w900, letterSpacing: 1.5)),
        SizedBox(height: 8),
        Text('DESCUBRE QUIÉN MIENTE', style: TextStyle(color: AppColors.textSub, fontSize: 12, letterSpacing: 3)),
      ],
    );
  }

  Widget _buildHeroImage() {
    return Container(
      height: 250, width: 250,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [AppColors.primary.withOpacity(0.4), Colors.transparent],
          stops: const [0.2, 0.7],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Image.asset('assets/images/logo_jusohr.png', fit: BoxFit.contain),
      ),
    );
  }

  Widget _buildSecondaryButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.white.withOpacity(0.05),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: const Text('Cómo jugar', style: TextStyle(color: Colors.white70, fontSize: 16)),
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAvatar(Colors.blue),
            const SizedBox(width: 5),
            _buildAvatar(Colors.orange),
            const SizedBox(width: 5),
            _buildAvatar(AppColors.primary, text: "+10k"),
          ],
        ),
        const SizedBox(height: 10),
        const Text('JUGADO POR GRUPOS EN TODO EL MUNDO', style: TextStyle(color: AppColors.textSub, fontSize: 10, letterSpacing: 1)),
      ],
    );
  }

  Widget _buildAvatar(Color color, {String? text}) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(color: AppColors.background, shape: BoxShape.circle),
      child: CircleAvatar(
        radius: 12, backgroundColor: color,
        child: text != null 
          ? Text(text, style: const TextStyle(fontSize: 8, color: AppColors.white))
          : const Icon(Icons.person, size: 14, color: AppColors.white),
      ),
    );
  }
}