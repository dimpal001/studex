import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_flutter_app/screens/auth/login_screen.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen();

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;

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
                "Enter OTP",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "We have sent a 6-digit code to your mobile number. Please enter it below.",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),

              Center(
                child: Pinput(
                  controller: _otpController,
                  length: 6,
                  defaultPinTheme: PinTheme(
                    width: 50,
                    height: 50,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF292935),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 50,
                    height: 50,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xFFF0363F)),
                    ),
                  ),
                  showCursor: true,
                  onCompleted: (pin) {
                    print("Entered OTP: $pin");
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Verify Button
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
                  onPressed: _isLoading
                      ? null
                      : () {
                          print("OTP Verified: ${_otpController.text}");
                        },
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Verify OTP",
                          style: TextStyle(fontSize: 16)),
                ),
              ),

              const SizedBox(height: 16),

              // Resend OTP
              Center(
                child: GestureDetector(
                  onTap: () {
                    print("Resend OTP");
                  },
                  child: const Text(
                    "Resend OTP?",
                    style: TextStyle(
                      color: Color(0xFFF0363F),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Back to Login
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: const Text(
                    "Back to Login",
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
