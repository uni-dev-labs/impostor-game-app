import 'package:flutter/material.dart';

class NumberCounter extends StatelessWidget {
  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;

  const NumberCounter({
    super.key,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1E143F),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSmallButton(Icons.remove, value > min),
          const SizedBox(width: 4),
          SizedBox(
            width: 36, // ancho fijo para evitar desborde
            child: Center(
              child: Text(
                value.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          _buildSmallButton(Icons.add, value < max),
        ],
      ),
    );
  }

  Widget _buildSmallButton(IconData icon, bool enabled) {
    return Container(
      decoration: BoxDecoration(
        color: enabled ? const Color(0xFF6200EE) : const Color(0xFF2A1E5A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 20),
        onPressed: enabled
            ? () => onChanged(value + (icon == Icons.add ? 1 : -1))
            : null,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
        splashRadius: 20,
      ),
    );
  }
}