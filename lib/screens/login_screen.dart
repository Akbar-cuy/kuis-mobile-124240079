import 'package:flutter/material.dart';
import 'package:LatihanKuis/root.dart';
import 'package:LatihanKuis/models/data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoggedIn = false;

  void _login({required String email, required String password}) {
    final trimmedUsername = email.trim();
    final trimmedPassword = password.trim();
    final matchingUsers = users.where(
      (user) =>
          user.username == trimmedUsername &&
          user.password == trimmedPassword,
    );

    if (matchingUsers.isNotEmpty) {
      final loggedInUser = matchingUsers.first;
      setState(() {
        _isLoggedIn = true;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Root(username: loggedInUser.username),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Login Berhasil!'),
        ),
      );
    } else {
      setState(() {
        _isLoggedIn = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Login Gagal!'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              spacing: 10,
              children: [
                if (!_isLoggedIn) ...[
                  Image.asset('lib/assets/images/LogoMieGacoan.png'),
                  Text(
                    'Selamat Datang di Gacoan'
                  ),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: 'Masukkan username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: '*********',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        _login(
                          email: _usernameController.text,
                          password: _passwordController.text,
                        );
                      },
                      child: const Text('Login'),
                    ),
                  ),
                ] else ...[
                  const Text('Login Anda Berhasil'),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isLoggedIn = false;
                        _usernameController.clear();
                        _passwordController.clear();
                      });
                    },
                    child: const Text('Kembali'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}


