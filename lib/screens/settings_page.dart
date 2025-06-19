import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/app_localizations.dart';
import '../providers/locale_provider.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(loc.translate("Language"))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: const Text("English"),
              leading: Radio<String>(
                value: 'en',
                groupValue: localeProvider.locale.languageCode,
                onChanged: (value) {
                  localeProvider.setLocale(const Locale('en'));
                },
              ),
            ),
            ListTile(
              title: const Text("العربية"),
              leading: Radio<String>(
                value: 'ar',
                groupValue: localeProvider.locale.languageCode,
                onChanged: (value) {
                  localeProvider.setLocale(const Locale('ar'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
