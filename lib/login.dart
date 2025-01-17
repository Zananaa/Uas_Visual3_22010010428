import 'package:flutter/material.dart';
import 'package:uas_visual3_2210010428/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String _correctAdminUsername = "admin";
  final String _correctAdminPassword = "admin";

  final String _correctOperatorUsername = "operator";
  final String _correctOperatorPassword = "operator";

  String _errorMessage = "";

  void _login() {
    setState(() {
      final username = _usernameController.text;
      final password = _passwordController.text;

      if (username == _correctAdminUsername &&
          password == _correctAdminPassword) {
        _errorMessage = "";
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else if (username == _correctOperatorUsername &&
          password == _correctOperatorPassword) {
        _errorMessage = "";
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else {
        _errorMessage = "Username atau Password salah!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              height: 35.0,
              child: ElevatedButton(
                onPressed: _login,
                child: const Text('Login', style: TextStyle(fontSize: 18.0)),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              _errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
