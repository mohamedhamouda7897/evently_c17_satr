import 'package:evently_c17_str/core/firebase_functions.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  'Create your account',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontSize: 24),

                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: nameController,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    labelText: 'Enter your name',
                    fillColor: Theme.of(context).colorScheme.onInverseSurface,

                    filled: true,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    prefixIcon: ImageIcon(
                      AssetImage("assets/images/user.png"),
                      color: Color(0xFF686868),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    labelText: 'Enter your email',
                    fillColor: Theme.of(context).colorScheme.onInverseSurface,
                    filled: true,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
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
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  style: Theme.of(context).textTheme.bodyMedium,
                  obscureText: !_isPasswordVisible,

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
                const SizedBox(height: 20),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  obscureText: !_isConfirmPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Confirm your password',
                    fillColor: Theme.of(context).colorScheme.onInverseSurface,
                    filled: true,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    prefixIcon: ImageIcon(
                      AssetImage("assets/images/lock.png"),
                      color: Color(0xFF686868),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible =
                              !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      FirebaseFunctions.createUser(
                        emailController.text,
                        passwordController.text,
                        nameController.text,
                        onSuccess: () {
                          Navigator.of(context).pop();
                        },
                        onError: (error) {
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
                    'Sign up',
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
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Login'),
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
                    // TODO: Implement Google signup
                  },
                  icon: Image.asset(
                    'assets/images/google_logo.png',
                    height: 24,
                  ),
                  label: const Text('Sign up with Google'),
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
