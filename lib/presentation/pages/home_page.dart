import 'package:auth_with_sql/core/theme_provider.dart';
import 'package:auth_with_sql/data/models/user_model.dart';
import 'package:auth_with_sql/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Hello ${user.firstName}",
              style: TextStyle(fontSize: 64 ,fontWeight: FontWeight.bold),
            ),
            Lottie.asset(
                'assets/images/Animation - 1725374754294.json', // Path to your Lottie JSON file
                width: 400,
                height: 400,
                fit: BoxFit.fill),
          ],
        ),
      ),
    );
  }
}
