import 'package:diy_challenge_app/screens/language_page.dart';
import 'package:diy_challenge_app/screens/my_challenges_page.dart';
import 'package:diy_challenge_app/screens/suggested_page.dart';
import 'package:diy_challenge_app/screens/topRated_screen.dart';
import 'package:diy_challenge_app/widget/challenges.dart';
import 'package:diy_challenge_app/utils/dark_theme_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/app_localizations.dart';
import 'categories_tab.dart';
import '../utils/responsive_helper.dart';

// Import Firebase Auth and flutter_secure_storage
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final isTablet = ResponsiveHelper.isTablet(context);
    final isDesktop = ResponsiveHelper.isDesktop(context);

    final drawerTextStyle = TextStyle(
      fontSize: isDesktop ? 20 : isTablet ? 18 : 16,
    );

    final headerTextStyle = TextStyle(
      color: Colors.white,
      fontSize: isDesktop ? 28 : isTablet ? 26 : 24,
    );

    // Instance of secure storage
    final secureStorage = const FlutterSecureStorage();

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            labelStyle: TextStyle(fontSize: isTablet || isDesktop ? 16 : 14),
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
                decoration: const BoxDecoration(color: Color(0xFF07A1FF)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/images/logo3.png',
                          width: 135,
                          height: 135,
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.playlist_add_check_outlined),
                title: Text(loc.translate("my_challenges"), style: drawerTextStyle),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const MyChallengesPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: Text(loc.translate("settings"), style: drawerTextStyle),
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: Text(loc.translate("language"), style: drawerTextStyle),
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
                title: Text(loc.translate("dark_mode"), style: drawerTextStyle),
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
                title: Text(loc.translate("notifications"), style: drawerTextStyle),
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip_outlined),
                title: Text(loc.translate("privacy_policy"), style: drawerTextStyle),
              ),
              ListTile(
                leading: const Icon(Icons.help_outline),
                title: Text(loc.translate("about"), style: drawerTextStyle),
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: Text(loc.translate("share"), style: drawerTextStyle),
              ),

              ListTile(
                leading: const Icon(Icons.logout),
                title: Text(loc.translate("logout"), style: drawerTextStyle),
                onTap: () async {

                  Navigator.pop(context);


                  await FirebaseAuth.instance.signOut();


                  await secureStorage.delete(key: 'remember_me');
                  await secureStorage.delete(key: 'email');
                  await secureStorage.delete(key: 'password');


                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/login',
                        (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ChallengeTabContent(),
            CategoriesTab(),
            TopRatedPage(),
            SuggestedPage(),
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
