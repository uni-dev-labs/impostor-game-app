import 'package:flutter/material.dart';
import 'package:impostor/providers/game_session_provider.dart';
import 'package:impostor/screens/role_impostor.dart';
import 'package:impostor/screens/role_user.dart';
import 'package:provider/provider.dart';

class RoleReveal extends StatelessWidget {
  const RoleReveal({super.key});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameSessionProvider>();
    
    return game.currentPlayerIsImpostor
        ? const RoleImpostor()
        : const RoleUser();
  }
}