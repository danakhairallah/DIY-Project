import 'package:diy_challenge_app/utils/app_localizations.dart';
import 'package:flutter/material.dart';

class SuggestedPage extends StatelessWidget {
  const SuggestedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

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
      appBar: AppBar(title: Text(loc.translate("suggested_challenges"))),
      body: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final item = suggestions[index];
          return Card(
            margin: const EdgeInsets.all(12),
            child: ListTile(
              leading: Image.asset(item['image']!, width: 60),
              title: Text(item['title']!),
              subtitle: Text(item['description']!),
              trailing: ElevatedButton(
                onPressed: () {
              Navigator.pushNamed(context, '/upload', arguments: item);
                },
                child: Text(loc.translate("start")),
              ),
            ),
          );
        },
      ),
    );
  }
}
