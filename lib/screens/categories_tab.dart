import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/challenge_provider.dart';
import '../utils/app_localizations.dart';
import '../utils/responsive_helper.dart'; // تأكدي من إضافة هذا

import 'challenge_details_page.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final challenges = Provider.of<ChallengeProvider>(context).challenges;
    final loc = AppLocalizations.of(context)!;

    final categories = challenges.map((c) => c.category.trim()).toSet().toList();

    final Map<String, String> categoryImages = {
      "category_physical_health": "assets/images/physical_health.jpeg",
      "category_personal_growth": "assets/images/personal_growth.jpg",
      "category_relationships": "assets/images/category_relationships.jpeg",
      "category_mindfulness": "assets/images/mindfulness_logo.png",
      "category_digital_detox": "assets/images/digital_detox_logo.png",
      "category_spiritual": "assets/images/category_spiritual.jpg",
    };

    final isDesktop = ResponsiveHelper.isDesktop(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    final horizontalMargin = isDesktop ? 50.0 : isTablet ? 30.0 : 12.0;
    final leadingSize = isDesktop ? 60.0 : isTablet ? 50.0 : 40.0;

    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (ctx, index) {
        final category = categories[index];
        final imagePath = categoryImages[category.toLowerCase()] ?? "";

        final categoryChallenges = challenges
            .where((ch) => ch.category.trim() == category)
            .toList();

        return Card(
          margin: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
          child: ExpansionTile(
            leading: imagePath.isNotEmpty
                ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: leadingSize,
                height: leadingSize,
                fit: BoxFit.cover,
              ),
            )
                : const Icon(Icons.category),
            title: Text(
              loc.translate(category),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isDesktop ? 20 : 16,
              ),
            ),
            children: categoryChallenges.map((challenge) {
              return ListTile(
                title: Text(
                  loc.translate(challenge.title),
                  style: TextStyle(fontSize: isDesktop ? 18 : 14),
                ),
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
          ),
        );
      },
    );
  }
}
