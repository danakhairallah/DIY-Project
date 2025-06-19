import 'package:diy_challenge_app/screens/challenge_details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/challenge_provider.dart';

class ChallengeTabContent extends StatelessWidget {
  const ChallengeTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final challenges = Provider.of<ChallengeProvider>(context).challenges;

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
          return Card(
            elevation: 20,
            child: SingleChildScrollView(
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
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          ch.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Text(
                              "${ch.rating} ⭐",
                              style: const TextStyle(fontSize: 13),
                            ),
                            IconButton(
                              icon: const Icon(Icons.info_outline, size: 20),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (_) =>
                                            ChallengeDetails(challengeId: ch.id),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
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
