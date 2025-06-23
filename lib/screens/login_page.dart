import 'package:flutter/material.dart';
import '../utils/app_localizations.dart';
import 'home_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final secureStorage = const FlutterSecureStorage();

  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    loadRememberMe();
  }

  void loadRememberMe() async {
    String? remember = await secureStorage.read(key: 'remember_me');
    if (remember == 'true') {
      String? savedEmail = await secureStorage.read(key: 'email');
      String? savedPassword = await secureStorage.read(key: 'password');
      setState(() {
        rememberMe = true;
        _emailController.text = savedEmail ?? '';
        _passwordController.text = savedPassword ?? '';
      });
    }
  }

  Future<void> _submit() async {
    final loc = AppLocalizations.of(context)!;
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        if (rememberMe) {
          await secureStorage.write(key: 'remember_me', value: 'true');
          await secureStorage.write(key: 'email', value: _emailController.text.trim());
          await secureStorage.write(key: 'password', value: _passwordController.text.trim());
        } else {
          await secureStorage.delete(key: 'remember_me');
          await secureStorage.delete(key: 'email');
          await secureStorage.delete(key: 'password');
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      } on FirebaseAuthException catch (e) {
        String msg = '';
        if (e.code == 'user-not-found') {
          msg = loc.translate('error_user_not_found');
        } else if (e.code == 'wrong-password') {
          msg = loc.translate('error_wrong_password');
        } else {
          msg = e.message ?? loc.translate('error_generic_login');
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(msg)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Color(0xFFB9D4F8)),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment:
              isRtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  loc.translate("login"),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0283D1),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  loc.translate("welcome_back"),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF0283D1),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: loc.translate("email"),
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator:
                              (value) =>
                          value!.isEmpty
                              ? loc.translate("required_field")
                              : null,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: loc.translate("password"),
                            prefixIcon: const Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator:
                              (value) =>
                          value!.length < 6
                              ? loc.translate("password_too_short")
                              : null,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: rememberMe,
                              activeColor: const Color(0xFF07A1FF),
                              onChanged: (value) async {
                                setState(() {
                                  rememberMe = value!;
                                });
                              },
                            ),
                            Text(
                              loc.translate(" rememberMe ?"),
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF07A1FF),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF07A1FF),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              loc.translate("login"),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              loc.translate("no_account"),
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: Text(
                                loc.translate("register"),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF07A1FF),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
