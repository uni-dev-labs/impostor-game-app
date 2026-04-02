import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

class ThemeWrapper extends StatelessWidget {
  final Widget child;

  const ThemeWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        return Scaffold(backgroundColor: appState.backgroundColor, body: child);
      },
    );
  }
}
