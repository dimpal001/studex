import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/Alert.dart';
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/screens/auth/signup_screen.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    final String phoneNumber = _phoneNumberController.text.trim();
    final String password = _passwordController.text.trim();

    if (phoneNumber.isEmpty || password.isEmpty) {
      Alert.show(context, "Please fill in all fields",
          type: SnackbarType.error);
      return;
    }

    if (!RegExp(r'^\d{10}$').hasMatch(phoneNumber)) {
      Alert.show(context, "Phone number must be 10 digits",
          type: SnackbarType.error);
      return;
    }

    setState(() => _isLoading = true);

    final url = Uri.parse('$baseUrl/auth/login');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "data": {
            "phoneNumber": phoneNumber,
            "password": password,
          },
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final user = responseData["resData"]["user"];
        final token = responseData["resData"]["token"];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userId', user["id"]);
        await prefs.setString('phoneNumber', user["phoneNumber"]);
        await prefs.setString('fullName', user["fullName"]);
        await prefs.setString('profileUrl', user["profileUrl"] ?? "");
        await prefs.setString('bio', user["bio"] ?? "");
        await prefs.setBool('isActive', user["isActive"]);
        await prefs.setString('className', user["class"]["name"]);
        await prefs.setString('token', token);

        Alert.show(context, responseData["resData"]["message"],
            type: SnackbarType.success);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        final errorMessage = responseData["error"] ?? "Login Failed";
        Alert.show(context, errorMessage, type: SnackbarType.error);
      }
    } catch (error) {
      Alert.show(context, "Error connecting to server",
          type: SnackbarType.error);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 20.0),
                    child: Center(
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              child: Icon(Icons.school,
                                  size: 50, color: Colors.white),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Studex AI",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              "Sign in to continue your journey.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 35),
                            _buildInputCard(),
                            const SizedBox(height: 20),
                            _buildForgotPassword(),
                            const SizedBox(height: 20),
                            _buildLoginButton(),
                            const SizedBox(height: 25),
                            _buildSignupPrompt(),
                            const SizedBox(height: 5),
                            _buildTermsAndConditionSection(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildInputCard() {
    return Column(
      children: [
        TextField(
          controller: _phoneNumberController,
          keyboardType: TextInputType.phone,
          maxLength: 10,
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary, fontSize: 18),
          decoration: InputDecoration(
            labelText: 'Phone Number',
            labelStyle:
                TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            prefixIcon: Icon(Icons.phone_android,
                color: Theme.of(context).colorScheme.onPrimary),
            counterText: "",
            filled: true,
            fillColor: Theme.of(context).colorScheme.surfaceContainer,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary, width: 2),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          ),
        ),
        const SizedBox(height: 15),
        TextField(
          controller: _passwordController,
          obscureText: !_isPasswordVisible,
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary, fontSize: 18),
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle:
                TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            prefixIcon: Icon(Icons.lock,
                color: Theme.of(context).colorScheme.onPrimary),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: () =>
                  setState(() => _isPasswordVisible = !_isPasswordVisible),
            ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surfaceContainer,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary, width: 2),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Alert.show(context, "Forgot Password feature coming soon!",
              type: SnackbarType.defaultType);
        },
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            children: [
              TextSpan(
                text: "Forgot Password",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _login,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: _isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : const Text(
                "Login",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  Widget _buildSignupPrompt() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignupScreen()),
        );
      },
      child: RichText(
        text: TextSpan(
          text: "Don't have an account? ",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary, fontSize: 14),
          children: [
            TextSpan(
              text: "Sign Up",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTermsAndConditionSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: TextSpan(
            text: "By continuing, you agree to our ",
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            children: [
              TextSpan(
                text: "Terms of Service",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => launchUrl(Uri.parse("https://dimpaldas.in")),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            children: [
              TextSpan(
                text: "and ",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              TextSpan(
                text: "Privacy Policy",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => launchUrl(Uri.parse("https://dimpaldas.in")),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
