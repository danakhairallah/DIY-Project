import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/app_localizations.dart';

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

  final List<String> _challenges = ['Challenge 1', 'Challenge 2', 'Challenge 3']; // استبدليهم لاحقًا حسب اللغة

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

    return Scaffold(
      appBar: AppBar(title: Text(loc.translate("Upload Your Result"))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(loc.translate("Photo/Video")),
            ElevatedButton.icon(
              onPressed: _pickMedia,
              icon: Icon(Icons.upload_file),
              label: Text(loc.translate("Choose file")),
            ),
            if (_selectedMedia != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Image.file(_selectedMedia!, height: 150),
              ),

            const SizedBox(height: 16),
            Text(loc.translate("Add Description")),
            TextField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: loc.translate(""),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),
            Text(loc.translate("Select Challenge")),
            DropdownButtonFormField<String>(
              value: _selectedChallenge,
              items: _challenges.map((challenge) {
                return DropdownMenuItem(
                  value: challenge,
                  child: Text(challenge),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedChallenge = value;
                });
              },
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),

            const SizedBox(height: 16),
            Text(loc.translate("Did Complete")),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: Text(loc.translate("yes")),
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
                    title: Text(loc.translate("no")),
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
                Text(
                  _selectedDate == null
                      ? loc.translate("no date selected")
                      : '${_selectedDate!.toLocal()}'.split(' ')[0],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: _pickDate,
                  child: Text(loc.translate("Choose Date")),
                ),
              ],
            ),

            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitResult,
              child: Text(loc.translate("Submit Result")),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
