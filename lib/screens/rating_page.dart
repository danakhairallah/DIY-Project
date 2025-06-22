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
        content: Text(AppLocalizations.of(context)!.translate("Thank You!")),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
            },
            child: Text(AppLocalizations.of(context)!.translate("close")),
          )
        ],
      ),
    );
  }

  Widget _buildStarRating(AppLocalizations loc, double iconSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          iconSize: iconSize,
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
    final size = MediaQuery.of(context).size;
    final horizontalPadding = size.width * 0.05;
    final iconSize = size.width * 0.12; // نجعل حجم النجوم نسبي للشاشة

    return Scaffold(
      appBar: AppBar(title: Text(loc.translate("rating"))),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 16),
        child: ListView(
          children: [
            _buildStarRating(loc, iconSize),
            SizedBox(height: size.height * 0.03),
            ElevatedButton(
              onPressed: _submitRating,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, size.height * 0.07),
              ),
              child: Text(
                loc.translate("Submit"),
                style: TextStyle(fontSize: size.width * 0.045),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
