import 'package:diy_challenge_app/screens/rating_page.dart';
import 'package:diy_challenge_app/screens/settings_page.dart';
import 'package:diy_challenge_app/screens/upload_result_page.dart';
import 'package:diy_challenge_app/widget/challenges.dart';
import 'package:diy_challenge_app/utils/dark_theme_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/app_localizations.dart';
import 'categories_tab.dart';

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
              Tab(
                icon: const Icon(Icons.explore),
                text: loc.translate("all_challenges"),
              ),
              Tab(
                icon: const Icon(Icons.category_outlined),
                text: loc.translate("categories"),
              ),
              Tab(
                icon: const Icon(Icons.stars),
                text: loc.translate("top_rated"),
              ),
              Tab(
                icon: const Icon(Icons.lightbulb),
                text: loc.translate("suggested"),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.deepPurpleAccent),
                child: Text(
                  loc.translate("diy_app_menu"),
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.playlist_add_check_outlined),
                title: Text(loc.translate("my_challenges")),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: Text(loc.translate("settings")),
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: Text(loc.translate("language")),
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
                title: Text(loc.translate("dark_mode")),
                trailing: Consumer<DarkTheme>(
                  builder: (context, themeProvider, _) {
                    final isDark = themeProvider.themeMode == ThemeMode.dark;
                    return Switch(
                      value: isDark,
                      onChanged: (value) {
                        themeProvider.toggleTheme(value);
                      },
                    );
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: Text(loc.translate("notifications")),
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip_outlined),
                title: Text(loc.translate("privacy_policy")),
              ),
              ListTile(
                leading: const Icon(Icons.help_outline),
                title: Text(loc.translate("about")),
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: Text(loc.translate("share")),
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: Text(loc.translate("logout")),
              ),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            const ChallengeTabContent(),
            const CategoriesTab(),
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
