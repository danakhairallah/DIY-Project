import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/app_localizations.dart';
import '../utils/responsive_helper.dart';  // تأكدي أنك لديك هذا الملف

class UploadResultPage extends StatefulWidget {
  const UploadResultPage({super.key});

  @override
  State<UploadResultPage> createState() => _UploadResultPageState();
}

class _UploadResultPageState extends State<UploadResultPage> {
  File? _selectedMedia;
  final TextEditingController _descriptionController = TextEditingController();
  String? _selectedChallenge;
  String? _completionStatus;
  DateTime? _selectedDate;

  final List<String> _challenges = [
    'Challenge 1',
    'Challenge 2',
    'Challenge 3',
  ];

  Future<void> _pickMedia() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedMedia = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _submitResult() {
    Navigator.pushNamed(context, '/rate');
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;

    // استخدمي ResponsiveHelper أو أبعاد الشاشة مباشرة
    double horizontalPadding = ResponsiveHelper.isMobile(context)
        ? 16
        : ResponsiveHelper.isTablet(context)
        ? 32
        : 48;

    double containerPadding = ResponsiveHelper.isMobile(context)
        ? 12
        : ResponsiveHelper.isTablet(context)
        ? 20
        : 30;

    double imageHeight = ResponsiveHelper.isMobile(context)
        ? 150
        : ResponsiveHelper.isTablet(context)
        ? 220
        : 300;

    double fontSizeTitle = ResponsiveHelper.isMobile(context)
        ? 16
        : ResponsiveHelper.isTablet(context)
        ? 20
        : 24;

    double fontSizeBody = ResponsiveHelper.isMobile(context)
        ? 14
        : ResponsiveHelper.isTablet(context)
        ? 16
        : 18;

    return Scaffold(
      appBar: AppBar(title: Text(loc.translate("upload_your_result"))),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 16),
        child: ListView(
          children: [
            Text(
              loc.translate("photo_video"),
              style: TextStyle(fontSize: fontSizeTitle, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: _pickMedia,
              icon: const Icon(Icons.upload_file),
              label: Text(loc.translate("choose_file"), style: TextStyle(fontSize: fontSizeBody)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveHelper.isMobile(context) ? 12 : 20,
                    vertical: ResponsiveHelper.isMobile(context) ? 10 : 16),
              ),
            ),
            if (_selectedMedia != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Image.file(_selectedMedia!, height: imageHeight, fit: BoxFit.cover),
              ),
            const SizedBox(height: 16),

            Container(
              padding: EdgeInsets.all(containerPadding),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loc.translate("add_description"),
                    style: TextStyle(fontSize: fontSizeTitle, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _descriptionController,
                    maxLines: 3,
                    style: TextStyle(fontSize: fontSizeBody),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(containerPadding),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loc.translate("select_challenge"),
                    style: TextStyle(fontSize: fontSizeTitle, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: _selectedChallenge,
                    items: _challenges.map((challenge) {
                      return DropdownMenuItem(
                        value: challenge,
                        child: Text(challenge, style: TextStyle(fontSize: fontSizeBody)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedChallenge = value;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Text(
              loc.translate("did_complete"),
              style: TextStyle(fontSize: fontSizeTitle, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: Text(loc.translate("yes"), style: TextStyle(fontSize: fontSizeBody)),
                    value: "yes",
                    groupValue: _completionStatus,
                    onChanged: (value) {
                      setState(() {
                        _completionStatus = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text(loc.translate("no"), style: TextStyle(fontSize: fontSizeBody)),
                    value: "no",
                    groupValue: _completionStatus,
                    onChanged: (value) {
                      setState(() {
                        _completionStatus = value;
                      });
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? loc.translate("no_date_selected")
                        : '${_selectedDate!.toLocal()}'.split(' ')[0],
                    style: TextStyle(fontSize: fontSizeBody),
                  ),
                ),
                ElevatedButton(
                  onPressed: _pickDate,
                  child: Text(loc.translate("choose_date"), style: TextStyle(fontSize: fontSizeBody)),
                ),
              ],
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _submitResult,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                padding: EdgeInsets.symmetric(
                  vertical: ResponsiveHelper.isMobile(context) ? 14 : 20,
                ),
              ),
              child: Text(
                loc.translate("submit_result"),
                style: TextStyle(fontSize: fontSizeTitle, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
