import 'package:diy_challenge_app/utils/app_localizations.dart';
import 'package:flutter/material.dart';

class SuggestedPage extends StatelessWidget {
  const SuggestedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
    final isLandscape = size.width > size.height;

    final List<Map<String, String>> suggestions = [
      {
        'title': loc.translate("mini_lamp_title"),
        'description': loc.translate("mini_lamp_description"),
        'image': 'assets/images/lamp.jpg',
      },
      {
        'title': loc.translate("plant_pot_title"),
        'description': loc.translate("plant_pot_description"),
        'image': 'assets/images/plant.jpg',
      },
    ];

    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.02,
        ),
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final item = suggestions[index];
          return Card(
            margin: EdgeInsets.symmetric(
              vertical: size.height * 0.01,
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03,
                vertical: size.height * 0.015,
              ),
              leading: Image.asset(
                item['image']!,
                width: isLandscape ? size.width * 0.1 : 60,
                height: isLandscape ? size.height * 0.15 : 60,
                fit: BoxFit.cover,
              ),
              title: Text(
                item['title']!,
                style: TextStyle(
                  fontSize: size.width * 0.045,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                item['description']!,
                style: TextStyle(fontSize: size.width * 0.035),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/upload', arguments: item);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04,
                    vertical: size.height * 0.012,
                  ),
                ),
                child: Text(
                  loc.translate("start"),
                  style: TextStyle(fontSize: size.width * 0.04),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
