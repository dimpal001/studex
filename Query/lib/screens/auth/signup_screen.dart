import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/constants/Alert.dart';
import 'package:my_flutter_app/constants/api.dart';
import 'dart:convert';
import 'package:my_flutter_app/screens/auth/login_screen.dart';
import 'package:my_flutter_app/screens/auth/otp_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _mobileController = TextEditingController();
  bool _isLoading = false;
  bool _agreeToTerms = false;

  Future<void> _signUp() async {
    final String mobile = _mobileController.text.trim();

    if (mobile.isEmpty) {
      Alert.show(context, "Phone number is required", type: SnackbarType.error);
      return;
    }

    if (!RegExp(r'^\d{10}$').hasMatch(mobile)) {
      Alert.show(context, "Phone number must be 10 digits",
          type: SnackbarType.error);
      return;
    }

    if (!_agreeToTerms) {
      Alert.show(context, "Please agree to the Terms and Conditions",
          type: SnackbarType.error);
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
          "data": {
            "phoneNumber": mobile,
          },
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Alert.show(context, "OTP Sent Successfully",
            type: SnackbarType.success);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => OTPScreen(phoneNumber: mobile)),
        );
      } else {
        Alert.show(context, responseData["error"] ?? "Sign Up Failed",
            type: SnackbarType.error);
      }
    } catch (error) {
      Alert.show(context, "Error connecting to server",
          type: SnackbarType.error);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Alert.show(context, "Could not launch $url", type: SnackbarType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Stack(
          children: [
            Positioned(
              top: -50,
              left: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                ),
              ),
            ),
            Positioned(
              bottom: -80,
              right: -80,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.15),
                ),
              ),
            ),
            SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        'assets/logo.svg',
                        height: 100,
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.onPrimary,
                            BlendMode.srcIn),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "Get Started",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        shadows: [
                          Shadow(
                            color: Colors.black26,
                            offset: Offset(2, 2),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Enter your phone number to receive an OTP.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.2)),
                      ),
                      child: Column(
                        children: [
                          TextField(
                            controller: _mobileController,
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 18),
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                              prefixIcon: Icon(Icons.phone_android,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                              counterText: "",
                              filled: true,
                              fillColor: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withOpacity(0.05),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: _agreeToTerms,
                          onChanged: (value) {
                            setState(() {
                              _agreeToTerms = value ?? false;
                            });
                          },
                          activeColor: Theme.of(context).colorScheme.primary,
                          checkColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              text: "I agree to the ",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                              children: [
                                WidgetSpan(
                                  child: GestureDetector(
                                    onTap: () =>
                                        _launchURL("https://dimpaldas.in"),
                                    child: Text(
                                      "Terms and Conditions",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 8,
                          shadowColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5),
                        ),
                        onPressed: _isLoading ? null : _signUp,
                        child: _isLoading
                            ? SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  strokeWidth: 2.5,
                                ),
                              )
                            : Text(
                                "Send OTP",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 16),
                          children: [
                            TextSpan(
                              text: "Log In",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => _launchURL("https://example.com/privacy"),
                      child: Text(
                        "Privacy Policy",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
