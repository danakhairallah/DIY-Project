import 'package:flutter/material.dart';
import '../utils/app_localizations.dart';
import '../utils/responsive_helper.dart';
import 'challenge_details_page.dart';

class TopRatedPage extends StatelessWidget {
  const TopRatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    final topRatedChallenges = [
      {
        'id':1,
        'title': loc.translate("challenge_photography"),
        'rating': 4.9,
        'description': loc.translate("challenge_photography_desc"),
        'image': Icons.camera_alt,
      },
      {
        'id':2,
        'title': loc.translate("challenge_cooking"),
        'rating': 4.8,
        'description': loc.translate("challenge_cooking_desc"),
        'image': Icons.restaurant_menu,
      },
      {
        'id':3,
        'title': loc.translate("challenge_crafts"),
        'rating': 4.7,
        'description': loc.translate("challenge_crafts_desc"),
        'image': Icons.brush,
      },
      {
        'id':4,
        'title': loc.translate("challenge_fitness"),
        'rating': 4.6,
        'description':loc.translate("challenge_fitness_desc"),
        'image': Icons.fitness_center,
      },
      {
        'id':5,
        'title': loc.translate("challenge_reading"),
        'rating': 4.5,
        'description': loc.translate("challenge_reading_desc"),
        'image': Icons.menu_book,
      },
      {
        'id':6,
        'title': loc.translate("challenge_gardening"),
        'rating': 4.4,
        'description': loc.translate("challenge_gardening_desc"),
        'image': Icons.local_florist,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),

        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            itemCount: topRatedChallenges.length,
            itemBuilder: (context, index) {
              final challenge = topRatedChallenges[index];

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: ResponsiveHelper.isMobile(context)?180:ResponsiveHelper.isTablet(context)?300:350 ,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade100,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      child: Center(
                        child: Icon(
                          challenge['image'] as IconData,
                          size: 80,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            challenge['title'].toString(),
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            challenge['description'].toString(),
                            style: const TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: List.generate(
                              5,
                                  (i) => Icon(
                                i < (challenge['rating'] as double).floor()
                                    ? Icons.star
                                    : Icons.star_border,
                                color: Colors.amber,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton.icon(
                              onPressed: () {

                                 Navigator.push(context, MaterialPageRoute(builder: (_) => ChallengeDetails(challengeId: challenge['id'].toString())));

                              },
                              icon: const Icon(Icons.play_arrow),
                             label:  Text(loc.translate("join_challenge"),
                                style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,),),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurpleAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
