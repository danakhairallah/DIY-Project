import 'package:flutter/material.dart';
import '../utils/app_localizations.dart';

class RatingPage extends StatelessWidget {
  const RatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(loc.translate("rating"))),
      body: const Center(
        child: Text("Thank you for participating!"),
      ),
    );
  }
}
