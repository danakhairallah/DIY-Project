import 'package:flutter/material.dart';
import '../utils/app_localizations.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
    //final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Scaffold(
      appBar: AppBar(title: Text(loc.translate("login"), style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1B1C3),),),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: loc.translate("email"),
                    labelStyle: TextStyle(fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3C3F58))),
                validator: (value) =>
                value!.isEmpty ? loc.translate("required_field") : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: loc.translate("password"),
                  labelStyle: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF3C3F58)),),
                obscureText: true,
                validator: (value) =>
                value!.length < 6 ? loc.translate("password_too_short") : null,
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
                child: Text(loc.translate("login"), style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),),

              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                style: TextButton.styleFrom(
                  side: BorderSide.none,
                  foregroundColor: Colors.blue,
                ),
                child: Text(loc.translate("register"),
                  style: TextStyle(fontSize: 14, color: Color(0xFF3579F6),),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
