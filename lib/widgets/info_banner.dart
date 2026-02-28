import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Banner informativo con icono y texto (opcionalmente con fragmento resaltado).
class InfoBanner extends StatelessWidget {
  const InfoBanner({
    super.key,
    this.message,
    this.highlight,
    this.messageAfter,
    this.icon = Icons.info_outline,
  }) : assert(
         message != null || (highlight != null && messageAfter != null),
         'Provide message or both highlight and messageAfter',
       );

  final String? message;
  final String? highlight;
  final String? messageAfter;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundSecondary.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: (highlight != null && messageAfter != null)
                ? RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: AppColors.textHint,
                        fontSize: 12,
                        height: 1.4,
                      ),
                      children: [
                        if (message != null) TextSpan(text: message),
                        TextSpan(
                          text: highlight,
                          style: const TextStyle(color: AppColors.primary),
                        ),
                        TextSpan(text: messageAfter),
                      ],
                    ),
                  )
                : Text(
                    message ?? '',
                    style: const TextStyle(
                      color: AppColors.textHint,
                      fontSize: 12,
                      height: 1.4,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
