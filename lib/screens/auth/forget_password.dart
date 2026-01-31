import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = "forget-password";

  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TODO: Add the illustration
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement reset password logic
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text('Reset password'),
            ),
          ],
        ),
      ),
    );
  }
}
