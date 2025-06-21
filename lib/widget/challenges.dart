import 'package:diy_challenge_app/screens/challenge_details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/challenge_provider.dart';
import '../utils/app_localizations.dart';

class ChallengeTabContent extends StatelessWidget {
  const ChallengeTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final challenges = Provider.of<ChallengeProvider>(context).challenges;
    final loc = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: GridView.builder(
        itemCount: challenges.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 26,
          crossAxisSpacing: 22,
          childAspectRatio: 0.83,
        ),
        itemBuilder: (ctx, i) {
          final ch = challenges[i];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChallengeDetails(challengeId: ch.id),
                ),
              );
            },
            child: Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.asset(
                      ch.imageUrl,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            loc.translate(ch.title),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${ch.rating} ⭐",
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
