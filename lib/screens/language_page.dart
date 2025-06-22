import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/app_localizations.dart';
import '../providers/locale_provider.dart';
import '../utils/responsive_helper.dart';  // استيراد ResponsiveHelper

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final localeProvider = Provider.of<LocaleProvider>(context);

    final isTablet = ResponsiveHelper.isTablet(context);
    final isDesktop = ResponsiveHelper.isDesktop(context);

    // تحديد عرض الـ Container بناءً على حجم الشاشة
    final containerWidth = isDesktop
        ? 450.0
        : isTablet
        ? 380.0
        : 320.0;

    final titleStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: isDesktop ? 26 : isTablet ? 22 : 18,
    );

    final subtitleStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontSize: isDesktop ? 18 : isTablet ? 16 : 14,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.translate("language")),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: containerWidth,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                loc.translate("choose_language"),
                style: titleStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                loc.translate("choose_language_subtitle"),
                style: subtitleStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ListTile(
                title: const Text("English"),
                leading: Radio<String>(
                  value: 'en',
                  groupValue: localeProvider.locale.languageCode,
                  onChanged: (value) {
                    if (value != null) {
                      localeProvider.setLocale(const Locale('en'));
                    }
                  },
                ),
              ),
              ListTile(
                title: Text(loc.translate("arabic")),
                leading: Radio<String>(
                  value: 'ar',
                  groupValue: localeProvider.locale.languageCode,
                  onChanged: (value) {
                    if (value != null) {
                      localeProvider.setLocale(const Locale('ar'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
