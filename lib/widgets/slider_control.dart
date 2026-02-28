import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_colors.dart';

/// Control deslizante con botones +/- para valores numéricos.
class SliderControl extends StatelessWidget {
  const SliderControl({
    super.key,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          _SliderControlButton(
            icon: Icons.remove,
            onTap: value > min
                ? () {
                    HapticFeedback.lightImpact();
                    onChanged(value - 1);
                  }
                : null,
            isPrimary: false,
          ),
          Expanded(
            child: Slider(
              value: value,
              min: min,
              max: max,
              divisions: (max - min).toInt(),
              activeColor: AppColors.primary,
              inactiveColor: AppColors.surfaceMuted,
              onChanged: onChanged,
            ),
          ),
          _SliderControlButton(
            icon: Icons.add,
            onTap: value < max
                ? () {
                    HapticFeedback.lightImpact();
                    onChanged(value + 1);
                  }
                : null,
            isPrimary: true,
          ),
        ],
      ),
    );
  }
}

class _SliderControlButton extends StatelessWidget {
  const _SliderControlButton({
    required this.icon,
    required this.onTap,
    required this.isPrimary,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: isPrimary ? AppColors.primary : AppColors.surfaceMuted,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: onTap != null ? AppColors.textPrimary : AppColors.textMuted,
          size: 24,
        ),
      ),
    );
  }
}
