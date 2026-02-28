import 'package:flutter/material.dart';
import '../core/app_colors.dart';

// Tarjeta para sumar y restar (Impostores, Rondas)
class CounterCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int value;
  final VoidCallback onMinus;
  final VoidCallback onPlus;

  const CounterCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onMinus,
    required this.onPlus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 12)),
        const SizedBox(height: 2),
        Text(subtitle, style: const TextStyle(color: AppColors.textSub, fontSize: 10)),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text(value.toString(), style: const TextStyle(color: AppColors.white, fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _CounterButton(icon: Icons.remove, onPressed: onMinus, color: Colors.transparent, iconColor: Colors.white54),
                    _CounterButton(icon: Icons.add, onPressed: onPlus, color: AppColors.primary, iconColor: AppColors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Botón interno del contador
class _CounterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;
  final Color iconColor;

  const _CounterButton({required this.icon, required this.onPressed, required this.color, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Icon(icon, color: iconColor, size: 20),
      ),
    );
  }
}

// Tarjeta de selección de temática
class ThemeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const ThemeCard({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.card,
          borderRadius: BorderRadius.circular(20),
          border: isSelected ? Border.all(color: AppColors.primary, width: 2) : null,
          boxShadow: isSelected ? [BoxShadow(color: AppColors.primary.withOpacity(0.4), blurRadius: 10, offset: const Offset(0, 5))] : [],
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: isSelected ? AppColors.white : Colors.white54, size: 30),
                  const SizedBox(height: 10),
                  Text(title, style: TextStyle(color: isSelected ? AppColors.white : Colors.white54, fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            if (isSelected)
              Positioned(
                top: 10, right: 10,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
                  child: const Icon(Icons.check, color: AppColors.primary, size: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }
}