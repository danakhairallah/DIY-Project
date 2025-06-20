import 'package:flutter/material.dart';
import '../utils/app_localizations.dart';

class MyChallengesPage extends StatelessWidget {
  const MyChallengesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.translate("my_challenges")),
      ),
      body: const Center(
        child: Text("No challenges completed yet."),
      ),
    );
  }
}
