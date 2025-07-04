import 'package:diy_challenge_app/utils/app_theme.dart';
import 'package:diy_challenge_app/providers/challenge_provider.dart';
import 'package:diy_challenge_app/providers/locale_provider.dart';
import 'package:diy_challenge_app/screens/home_page.dart';
import 'package:diy_challenge_app/screens/login_page.dart';
import 'package:diy_challenge_app/screens/my_challenges_page.dart';
import 'package:diy_challenge_app/screens/rating_page.dart';
import 'package:diy_challenge_app/screens/registration_page.dart';
import 'package:diy_challenge_app/screens/settings_page.dart';
import 'package:diy_challenge_app/screens/upload_result_page.dart';
import 'package:diy_challenge_app/screens/splash_screen.dart';
import 'package:diy_challenge_app/utils/app_localizations.dart';
import 'package:diy_challenge_app/utils/dark_theme_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChallengeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => DarkTheme()),

      ],
      child: Consumer2<LocaleProvider, DarkTheme>(
        builder: (context, localeProvider, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'DIY Challenges',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            locale: localeProvider.locale,
            supportedLocales: const [Locale('en', ''), Locale('ar', '')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
          
            routes: {
              '/login': (_) => const LoginPage(),
              '/register': (_) => const RegisterPage(),
              '/my': (_) => const MyChallengesPage(),
              '/upload': (_) => const UploadResultPage(),
              '/rate': (_) => const RatingPage(),
              '/splash': (_) => const SplashScreen(),
              '/setting': (_) => const LanguagePage(),
              '/home': (_) => const HomePage(),
            },
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
