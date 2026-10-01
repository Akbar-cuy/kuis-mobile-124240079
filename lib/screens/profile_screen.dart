import 'package:flutter/material.dart';
import 'package:LatihanKuis/screens/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  final String username;

  const ProfileScreen({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circle Avatar dengan Icon Profil
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.purple.shade50,
              child: const Icon(
                Icons.person,
                size: 55,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),

            // Label 'Username'
            Text(
              'Username',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 6),

            // Value Username Dinamis
            Text(
              username,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),

            // Tombol Logout Bergaya Pill / Rounded
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout, size: 18),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade50,
                foregroundColor: Colors.deepPurple,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: Colors.purple.shade100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}