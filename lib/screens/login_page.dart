import 'package:flutter/material.dart';
import 'package:eduverse/services/auth_service.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo / App Icon
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue.shade50,
                  child: const Icon(
                    Icons.school,
                    size: 60,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 20),

                // App Title
                const Text(
                  "EduVerse",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),

                // Subtitle
                const Text(
                  "Learn. Explore. Grow.",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 40),

                // Google Sign In Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Colors.blue),
                      ),
                      elevation: 2,
                    ),
                    icon: Image.asset(
                      "assets/google_logo.png", // place Google logo in assets
                      height: 24,
                      width: 24,
                    ),
                    label: Text(
                      "Sign in with Google",
                      style: GoogleFonts.poppins(
                          color : Colors.blue,
                      ),
                    ),
                    onPressed: () async {
                      final user = await AuthService().signInWithGoogle();
                      if (user != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Welcome ${user.displayName}!")),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Google Sign-In failed")),
                        );
                      }
                    },
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
