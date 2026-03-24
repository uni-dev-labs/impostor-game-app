import 'package:flutter/material.dart';

class ImpostorPlayer {
  final String name;
  final String role;
  final Color avatarColor;

  const ImpostorPlayer({
    required this.name,
    required this.role,
    required this.avatarColor,
  });
}

class ImpostorsList extends StatelessWidget {
  final List<ImpostorPlayer> impostors;

  const ImpostorsList({super.key, required this.impostors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            "LOS IMPOSTORES ERAN",
            style: TextStyle(
              color: Color(0xFF1A3DBF),
              fontSize: 11,
              letterSpacing: 2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 12),
        ...impostors.map((player) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _ImpostorTile(player: player),
            )),
      ],
    );
  }
}

class _ImpostorTile extends StatelessWidget {
  final ImpostorPlayer player;

  const _ImpostorTile({required this.player});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF0F1230),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withOpacity(0.06),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: player.avatarColor.withOpacity(0.2),
              border: Border.all(
                color: player.avatarColor.withOpacity(0.4),
                width: 1.5,
              ),
            ),
            child: Icon(Icons.person, color: player.avatarColor, size: 24),
          ),
          const SizedBox(width: 14),
          // Nombre y rol
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  player.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  player.role,
                  style: TextStyle(
                    color: player.avatarColor.withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          // Ícono ojo
          Icon(
            Icons.visibility,
            color: const Color(0xFF1A3DBF).withOpacity(0.7),
            size: 20,
          ),
        ],
      ),
    );
  }
}