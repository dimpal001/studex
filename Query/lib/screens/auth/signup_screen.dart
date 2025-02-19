import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/constants/Alert.dart';
import 'package:my_flutter_app/constants/api.dart';
import 'dart:convert';

import 'package:my_flutter_app/screens/auth/login_screen.dart';
import 'package:my_flutter_app/screens/auth/otp_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen();

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isLoading = false;

  Future<void> _signUp() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => OTPScreen()));

    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();
    final String confirmPassword = _confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Alert.show(context, "All fields are required", type: SnackbarType.error);
      return;
    }

    if (password != confirmPassword) {
      Alert.show(context, "Password do not matched", type: SnackbarType.error);
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('$baseUrl/auth/signup');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "mobile": email,
          "password": password,
        }),
      );

      final responseData = jsonDecode(response.body);

      print(responseData);

      if (response.statusCode == 200) {
        Alert.show(context, "Sign Up Successful", type: SnackbarType.error);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OTPScreen()),
        );
      } else {
        Alert.show(context, responseData["message"] ?? "Sign Up Failed",
            type: SnackbarType.error);
      }
    } catch (error) {
      print("Error: ${error.toString()}");
      Alert.show(context, "Error connecting to server",
          type: SnackbarType.error);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFF171720)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: SvgPicture.asset(
                  'assets/logo.svg',
                  height: 70,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Create Account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Enter your details below to create a new account.",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF292935),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      maxLength: 10,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 15),
                        filled: false,
                        hintText: 'Mobile Number',
                        hintStyle: const TextStyle(color: Colors.white54),
                        prefixIcon: const Icon(Icons.call, color: Colors.white),
                        counterText: "",
                        border: InputBorder.none,
                      ),
                    ),
                    const Divider(color: Colors.white30),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                        filled: false,
                        hintText: 'Password',
                        hintStyle: const TextStyle(color: Colors.white54),
                        prefixIcon: const Icon(Icons.lock, color: Colors.white),
                        suffixIcon:
                            const Icon(Icons.visibility, color: Colors.white),
                        border: InputBorder.none,
                      ),
                    ),
                    const Divider(color: Colors.white30),
                    TextField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                        filled: false,
                        hintText: 'Confirm Password',
                        hintStyle: const TextStyle(color: Colors.white54),
                        prefixIcon: const Icon(Icons.lock, color: Colors.white),
                        suffixIcon:
                            const Icon(Icons.visibility, color: Colors.white),
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF0363F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: _isLoading ? null : _signUp,
                  child: _isLoading
                      ? Opacity(
                          opacity: 0.6,
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : const Text("Sign Up", style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: const Text(
                    "Already have an account? Log in",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
