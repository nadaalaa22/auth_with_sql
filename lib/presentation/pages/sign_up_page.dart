import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/theme_provider.dart';
import '../../data/datasource/database.dart';
import '../../data/models/user_model.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> globalKeyForm = GlobalKey<FormState>();
  bool flag = false;

  final DatabaseHelper _dbHelper = DatabaseHelper();


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
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/images/undraw_mobile_login_re_9ntv.svg",
                  width: 200,
                  height: 200,
                ),
                Form(
                  key: globalKeyForm,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: firstNameController,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: 'First Name',
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.9),
                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
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
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                controller: lastNameController,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: 'Last Name',
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.9),
                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
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
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: emailController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Email',
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.9),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(Icons.email,
                                color: Color(0xff6C63FF)),
                          ),
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'Field cannot be null';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: passwordController,
                          style: TextStyle(color: Colors.black),
                          obscureText: !flag,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.9),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(Icons.lock,
                                color: Color(0xff6C63FF)),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  flag = !flag; // Toggle the flag
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
                        const SizedBox(
                          height: 30,
                        ),
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
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                backgroundColor: const Color(0xff6C63FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                if (globalKeyForm.currentState!.validate()) {
                                  User newUser = User(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                  _dbHelper.insertUser(newUser).then((_) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()),
                                    );
                                  });
                                }
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an acount ? ',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => LoginPage()));
                              },
                              child: const Text('Login now ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff6C63FF),
                                  )),
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
      ),
    );
  }
}
