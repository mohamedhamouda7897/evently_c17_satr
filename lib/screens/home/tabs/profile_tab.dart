import 'package:evently_c17_str/core/firebase_functions.dart';
import 'package:evently_c17_str/screens/auth/login.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                FirebaseFunctions.signOut();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  LoginScreen.routeName,
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(),
              child: Text(
                "Sign Out",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
