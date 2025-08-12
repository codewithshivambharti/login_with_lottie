// main.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

/*
Add this to your pubspec.yaml:

dependencies:
  flutter:
    sdk: flutter
  lottie: ^2.7.0

Then run: flutter pub get
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Simple Login', home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  bool isLoggedIn = false;

  void login() {
    if (nameController.text.isNotEmpty) {
      setState(() {
        isLoggedIn = true;
      });
    }
  }

  void logout() {
    setState(() {
      isLoggedIn = false;
      nameController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: isLoggedIn ? _buildHomeScreen() : _buildLoginScreen(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginScreen() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Lottie animation
        Container(
          width: 150,
          height: 150,
          child: Lottie.network(
            'https://assets5.lottiefiles.com/packages/lf20_jcikwtux.json',
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: 20),

        Text(
          'Welcome!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),

        TextField(
          controller: nameController,
          decoration: InputDecoration(
            hintText: 'Enter your name',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),

        ElevatedButton(onPressed: login, child: Text('Login')),
      ],
    );
  }

  Widget _buildHomeScreen() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 150,
          height: 150,
          child: Lottie.network(
            'https://assets9.lottiefiles.com/packages/lf20_lk80fpsm.json',
            fit: BoxFit.fill,
            repeat: false,
          ),
        ),
        SizedBox(height: 20),

        Text(
          'Hello, ${nameController.text}!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),

        Text('Welcome to the app!'),
        SizedBox(height: 20),

        ElevatedButton(onPressed: logout, child: Text('Logout')),
      ],
    );
  }
}
