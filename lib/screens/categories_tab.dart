import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/challenge_provider.dart';
import '../utils/app_localizations.dart';
import 'challenge_details_page.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final challenges = Provider.of<ChallengeProvider>(context).challenges;
    final loc = AppLocalizations.of(context)!;

    final categories = challenges
        .map((c) => c.category.trim())
        .toSet()
        .toList();

    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (ctx, index) {
        final category = categories[index];

        final categoryChallenges = challenges
            .where((ch) => ch.category.trim() == category)
            .toList();

        return ExpansionTile(
          title: Text(
            loc.translate(category),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          children: categoryChallenges.map((challenge) {
            return ListTile(
              title: Text(loc.translate(challenge.title)),
              leading: const Icon(Icons.check_circle_outline),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChallengeDetails(challengeId: challenge.id),
                  ),
                );
              },
            );
          }).toList(),
        );
      },
    );
  }
}
