import 'package:flutter/material.dart';
import '../utils/app_localizations.dart';

class UploadResultPage extends StatelessWidget {
  const UploadResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(loc.translate("upload_result"))),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/rate');
          },
          child: Text(loc.translate("submit_result")),
        ),
      ),
    );
  }
}
