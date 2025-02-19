import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_flutter_app/constants/Alert.dart';
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/constants/encryption.dart';
import 'package:my_flutter_app/screens/auth/signup_screen.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isPassword = true;

  Future<void> _login() async {
    final String phoneNumber = _phoneNumberController.text.trim();
    final String password = _passwordController.text.trim();

    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('$baseUrl/auth/login');

    final String deviceId = await _getOrCreateDeviceId();

    final encryptedData = Encryption.encryptData({
      "phoneNumber": phoneNumber,
      "password": password,
      "deviceId": deviceId
    });

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"data": encryptedData}),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final decryptedResponse =
            Encryption.decryptData(responseData["resData"]);

        final user = decryptedResponse["user"];
        final token = decryptedResponse["token"];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userId', user["id"]);
        await prefs.setString('phoneNumber', user["phoneNumber"]);
        await prefs.setString('fullName', user["fullName"]);
        await prefs.setString('profileUrl', user["profileUrl"] ?? "");
        await prefs.setString('bio', user["bio"] ?? "");
        await prefs.setBool('isActive', user["isActive"]);
        await prefs.setString('classId', user["classId"]);
        await prefs.setString('boardId', user["boardId"]);
        await prefs.setString('token', token);

        Alert.show(context, decryptedResponse["message"],
            type: SnackbarType.success);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        final errorMessage = responseData["error"] ?? "Login Failed";
        print("Error Message: $errorMessage");
        Alert.show(context, errorMessage, type: SnackbarType.error);
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

  Future<String> _getOrCreateDeviceId() async {
    final prefs = await SharedPreferences.getInstance();
    String? deviceId = prefs.getString('deviceId');

    if (deviceId == null) {
      deviceId = Uuid().v4(); // Generate a random UUID
      await prefs.setString('deviceId', deviceId);
    }

    return deviceId;
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
                "Welcome Back!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Enter your mobile number and password to get access to your account.",
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
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                        filled: false,
                        hintText: 'Mobile Number',
                        hintStyle: const TextStyle(color: Colors.white54),
                        prefixIcon: const Icon(Icons.call, color: Colors.white),
                        border: InputBorder.none,
                        counterText: "",
                      ),
                    ),
                    const Divider(color: Colors.white30),
                    TextField(
                      controller: _passwordController,
                      obscureText: _isPassword ? true : false,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                        filled: false,
                        hintStyle: const TextStyle(color: Colors.white54),
                        prefixIcon: const Icon(Icons.lock, color: Colors.white),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPassword = !_isPassword;
                            });
                          },
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Color(0xFFF0363F),
                    fontWeight: FontWeight.bold,
                  ),
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
                  onPressed: _isLoading ? null : _login,
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
                      : const Text(
                          "Login",
                          style: TextStyle(fontSize: 16),
                        ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: const Text(
                    "Don't have an account? Create account",
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
