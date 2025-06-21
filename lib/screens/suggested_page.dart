import 'package:flutter/material.dart';

class SuggestedPage extends StatelessWidget {
  const SuggestedPage({super.key});

  final List<Map<String, String>> suggestions = const [
    {
      'title': 'Create a Mini Lamp',
      'description': 'Use simple materials to make a decorative lamp.',
      'image': 'assets/images/lamp.jpg',
    },
    {
      'title': 'DIY Plant Pot',
      'description': 'Reuse bottles to grow your plant.',
      'image': 'assets/images/plant.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Suggested Challenges')),
      body: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(suggestion['image']!),
              title: Text(suggestion['title']!),
              subtitle: Text(suggestion['description']!),
              trailing: ElevatedButton(
                onPressed: () {
                  // Navigate to challenge details
                },
                child: Text('Start'),
              ),
            ),
          );
        },
      ),
    );
  }
}
