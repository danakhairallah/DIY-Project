import 'package:diy_challenge_app/screens/my_challenges_page.dart';
import 'package:diy_challenge_app/screens/rating_page.dart';
import 'package:diy_challenge_app/screens/settings_page.dart';
import 'package:diy_challenge_app/screens/upload_result_page.dart';
import 'package:diy_challenge_app/widget/challenges.dart';
import 'package:flutter/material.dart';
import '../utils/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
         bottom: TabBar(
            tabs: [
              Tab(icon: const Icon(Icons.explore), text: "All Challenges"),
              Tab(
                icon: const Icon(Icons.category_outlined),
                text: loc.translate("Categories"),
              ),
              Tab(
                icon: const Icon(Icons.stars),
                text: loc.translate("Top Rated"),
              ),
              Tab(
                icon: const Icon(Icons.lightbulb),
                text: loc.translate("Suggested"),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.deepPurpleAccent),
                child: Text(
                  'DIY App Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: Text(loc.translate("Settings")),
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: Text(loc.translate("Language")),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LanguagePage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: Text(loc.translate("Dark Mode")),
              ),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: Text(loc.translate("Notifications")),
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip_outlined),
                title: Text(loc.translate("Privacy Policy")),
              ),
              ListTile(
                leading: const Icon(Icons.help_outline),
                title: Text(loc.translate("About")),
              ),  ListTile(
                leading: const Icon(Icons.share),
                title: Text(loc.translate("Share")),
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: Text(loc.translate("Logout")),
              ),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            const ChallengeTabContent(),
            const MyChallengesPage(),
            const UploadResultPage(),
            const RatingPage(),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required Widget page,
  }) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
    );
  }
}
