import 'package:flutter/material.dart';
import '../utils/app_localizations.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  int _rating = 0;

  void _submitRating() {
    // Firebase

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
      //  title: Text(AppLocalizations.of(context)!.translate("Thank You!")),
        content: Text(AppLocalizations.of(context)!.translate("Thank You!")),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.translate("close")),
          )
        ],
      ),
    );
  }

  Widget _buildStarRating(AppLocalizations loc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            Icons.star,
            color: index < _rating ? Colors.amber : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _rating = index + 1;
            });
          },
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(loc.translate("rating"))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildStarRating(loc),
            const SizedBox(height: 16),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitRating,
              child: Text(loc.translate("Submit")),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            )
          ],
        ),
      ),
    );
  }
}
