import 'package:evently_c17_str/core/extensions.dart';
import 'package:evently_c17_str/core/firebase_functions.dart';
import 'package:evently_c17_str/screens/auth/register.dart';
import 'package:evently_c17_str/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 50),
                Image.asset('assets/images/logo.png', height: 40),
                const SizedBox(height: 50),
                Text(
                  'Login to your account',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontSize: 24),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 30),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Enter your email',
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onInverseSurface,
                    prefixIcon: ImageIcon(
                      AssetImage("assets/images/sms.png"),
                      color: Color(0xFF686868),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    final bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(value);
                    if (!emailValid) {
                      return "Invalid email";
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  obscureText: !_isPasswordVisible,
                  style: Theme.of(context).textTheme.bodyMedium,

                  decoration: InputDecoration(
                    labelText: 'Enter your password',
                    fillColor: Theme.of(context).colorScheme.onInverseSurface,

                    filled: true,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    prefixIcon: ImageIcon(
                      AssetImage("assets/images/lock.png"),
                      color: Color(0xFF686868),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Forget Password?'),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      FirebaseFunctions.login(
                        emailController.text,
                        passwordController.text,
                        () {
                          authProvider.initUser();
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomeScreen.routeName,
                            (route) => false,
                          );
                        },
                        (error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              content: Text(
                                error,
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },

                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      },
                      child: const Text('Signup'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Or'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Implement Google login
                  },
                  icon: Image.asset(
                    'assets/images/google_logo.png',
                    height: 24,
                  ),
                  // Assuming you have a google logo
                  label: const Text('Login with Google'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
