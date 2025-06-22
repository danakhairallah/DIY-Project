import 'package:diy_challenge_app/screens/upload_result_page.dart';
import 'package:flutter/material.dart';
import '../utils/app_localizations.dart';
import '../utils/responsive_helper.dart';
import 'challenge_details_page.dart';

class TopRatedPage extends StatelessWidget {
  const TopRatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;

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

    double cardHeight = ResponsiveHelper.isMobile(context) ? 180 :
    ResponsiveHelper.isTablet(context) ? 300 : 350;

    double iconSize = ResponsiveHelper.isMobile(context) ? 60 :
    ResponsiveHelper.isTablet(context) ? 80 : 100;

    double titleFontSize = ResponsiveHelper.isMobile(context) ? 16 :
    ResponsiveHelper.isTablet(context) ? 20 : 24;

    double descFontSize = ResponsiveHelper.isMobile(context) ? 12 :
    ResponsiveHelper.isTablet(context) ? 14 : 16;

    double starSize = ResponsiveHelper.isMobile(context) ? 16 :
    ResponsiveHelper.isTablet(context) ? 20 : 24;

    double buttonFontSize = ResponsiveHelper.isMobile(context) ? 14 :
    ResponsiveHelper.isTablet(context) ? 16 : 18;

    double buttonPaddingHorizontal = ResponsiveHelper.isMobile(context) ? 16 :
    ResponsiveHelper.isTablet(context) ? 20 : 24;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            itemCount: topRatedChallenges.length,
            itemBuilder: (context, index) {
              final challenge = topRatedChallenges[index];

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: size.height * 0.012),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: cardHeight,
                      decoration: BoxDecoration(
                        color: const Color(0xFFB9D4F8),
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      child: Center(
                        child: Icon(
                          challenge['image'] as IconData,
                          size: iconSize,
                          color: const Color(0xFF07A1FF),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(size.width * 0.035),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            challenge['title'].toString(),
                            style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: size.height * 0.005),
                          Text(
                            challenge['description'].toString(),
                            style: TextStyle(
                              fontSize: descFontSize,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Row(
                            children: List.generate(
                              5,
                                  (i) => Icon(
                                i < (challenge['rating'] as double).floor()
                                    ? Icons.star
                                    : Icons.star_border,
                                color: Colors.amber,
                                size: starSize,
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.015),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_) => const UploadResultPage()));
                              },
                              label: Text(
                                loc.translate("start"),
                                style: TextStyle(
                                  fontSize: buttonFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF07A1FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: buttonPaddingHorizontal,
                                  vertical: size.height * 0.015,
                                ),
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
