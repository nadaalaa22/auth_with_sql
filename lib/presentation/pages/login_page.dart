import 'package:auth_with_sql/presentation/pages/home_page.dart';
import 'package:auth_with_sql/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../core/theme_provider.dart';
import '../../data/datasource/database.dart';
import '../../data/models/user_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> globalKeyForm = GlobalKey<FormState>();
  final DatabaseHelper _dbHelper = DatabaseHelper();
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                  },
                  icon: const Icon(Icons.dark_mode))),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/images/undraw_mobile_login_re_9ntv.svg",
                width: 200,
                height: 200,
              ), // تعديل هنا
              Form(
                key: globalKeyForm,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: emailController,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Email',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.9),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon:
                              const Icon(Icons.email, color: Color(0xff6C63FF)),
                        ),
                        validator: (text) {
                          if (text!.isEmpty) {
                            return 'Field cannot be null';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        style: const TextStyle(color: Colors.black),
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.9),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon:
                              const Icon(Icons.lock, color: Color(0xff6C63FF)),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                flag = !flag;
                              });
                            },
                            icon: Icon(
                              flag
                                  ? Icons.visibility
                                  : Icons.visibility_off, // Toggle icon
                            ),
                          ),
                        ),
                        validator: (text) {
                          if (text!.isEmpty) {
                            return 'Field cannot be null';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: const Color(0xff6C63FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            if (globalKeyForm.currentState!.validate()) {
                              _dbHelper
                                  .getUser(
                                emailController.text,
                                passwordController.text,
                              )
                                  .then((User? user) {
                                if (user != null) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => HomePage(user: user),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Login Failed! Please check your credentials.'),
                                    ),
                                  );
                                }
                              });
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              fontSize: 18,

                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SignUpPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Register now',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff6C63FF),
                              ),
                            ),
                          )
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
    );
  }
}
