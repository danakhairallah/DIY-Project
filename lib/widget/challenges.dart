import 'package:diy_challenge_app/screens/challenge_details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/challenge_provider.dart';
import '../utils/app_localizations.dart';

class ChallengeTabContent extends StatelessWidget {
  const ChallengeTabContent({super.key});

  int _getCrossAxisCount(double width) {
    if (width >= 1200) {
      return 4; // ديسكتوب كبير
    } else if (width >= 800) {
      return 3; // تابليت
    } else {
      return 2; // موبايل
    }
  }

  double _getChildAspectRatio(double width) {
    if (width >= 1200) {
      return 1.0;
    } else if (width >= 800) {
      return 0.9;
    } else {
      return 0.83;
    }
  }

  EdgeInsets _getPadding(double width) {
    if (width >= 1200) {
      return const EdgeInsets.all(40);
    } else if (width >= 800) {
      return const EdgeInsets.all(30);
    } else {
      return const EdgeInsets.all(20);
    }
  }

  double _getImageHeight(double width) {
    if (width >= 1200) {
      return 140;
    } else if (width >= 800) {
      return 120;
    } else {
      return 100;
    }
  }

  double _getFontSizeTitle(double width) {
    if (width >= 1200) {
      return 18;
    } else if (width >= 800) {
      return 17;
    } else {
      return 16;
    }
  }

  double _getFontSizeRating(double width) {
    if (width >= 1200) {
      return 14;
    } else if (width >= 800) {
      return 13;
    } else {
      return 13;
    }
  }

  @override
  Widget build(BuildContext context) {
    final challenges = Provider.of<ChallengeProvider>(context).challenges;
    final loc = AppLocalizations.of(context)!;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: _getPadding(screenWidth),
      child: GridView.builder(
        itemCount: challenges.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _getCrossAxisCount(screenWidth),
          mainAxisSpacing: 26,
          crossAxisSpacing: 22,
          childAspectRatio: _getChildAspectRatio(screenWidth),
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
                      height: _getImageHeight(screenWidth),
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
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: _getFontSizeTitle(screenWidth),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${ch.rating} ⭐",
                            style: TextStyle(fontSize: _getFontSizeRating(screenWidth)),
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
