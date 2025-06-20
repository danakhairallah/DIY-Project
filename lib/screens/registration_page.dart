import 'package:flutter/material.dart';
import '../utils/app_localizations.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _selectedGender;
  final TextEditingController _ageController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(loc.translate("register"),style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Color(0xFF1B1C3)),)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: loc.translate("name"),
                        labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xFF3C3F58)),
                    ),
                    validator: (value) =>
                    value!.isEmpty ? loc.translate("required_field") : null,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: loc.translate("email"),
                      labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xFF3C3F58)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return loc.translate("required_field");
                      }
                      // Regular Expression for basic email validation
                      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (!emailRegex.hasMatch(value)) {
                        return loc.translate("invalid_email");
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: loc.translate("password"),
                      labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xFF3C3F58)),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return loc.translate("required_field");
                      }

                      final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
                      if (!passwordRegex.hasMatch(value)) {
                        return loc.translate("weak_password");
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  DropdownButtonFormField<String>(
                    value: _selectedGender,
                    decoration: InputDecoration(
                      labelText: loc.translate("gender"),
                      labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xFF3C3F58)),
                      border: OutlineInputBorder(),
                    ),
                    items: ['Male', 'Female', 'Other']
                        .map((gender) => DropdownMenuItem<String>(
                      value: gender,
                      child: Text(loc.translate(gender.toLowerCase())),
                    ))
                        .toList(),
                    onChanged: (value) {
                      _selectedGender = value;
                    },
                    validator: (value) =>
                    value == null ? loc.translate("required_field") : null,
                  ),
                  const SizedBox(height: 10),

                  // Age Field
                  TextFormField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: loc.translate("age"),
                      labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xFF3C3F58)),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return loc.translate("required_field");
                      }
                      final age = int.tryParse(value);
                      if (age == null || age <= 0 || age > 120) {
                        return loc.translate("invalid_age");
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5F8DFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(loc.translate("register"),
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      side: BorderSide.none,
                      foregroundColor: Colors.blue,
                    ),
                    child: Text(loc.translate("login"),
                      style: TextStyle(fontSize: 14,color: Color(0xFF3579F6),),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

