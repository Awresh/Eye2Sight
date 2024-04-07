import 'package:eye2sight/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:eye2sight/widgets/app_bars/custom_app_bar.dart';

class OTPValidationPage extends StatefulWidget {
  const OTPValidationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OTPValidationPageState createState() => _OTPValidationPageState();
}

class _OTPValidationPageState extends State<OTPValidationPage> {
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  late OTPController _otpController;
  bool _resendEnabled = false;

  @override
  void initState() {
    super.initState();
    _otpController = OTPController(180, _onTimerTick, _enableResendButton);
  }

  void _onTimerTick() {
    setState(() {
      _otpController.decrementTime();
      if (_otpController.getFormattedTime() == '00:00') {
        _otpController.stopTimer();
      }
    });
  }

  void _enableResendButton() {
    setState(() {
      _resendEnabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Unfocus any focused text field
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          leadingIconPath: 'images/back.svg',
          // or any other icon path
          onLeadingPressed: () {
            // Navigate back when the back button is pressed
            Navigator.pop(context);
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Check your Email / Phone',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'We’ve sent the code to your email & Phone',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: List.generate(
                    4,
                    (index) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: TextField(
                          controller: _otpControllers[index],
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            counter: const Offstage(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          onChanged: (value) {
                            if (value.isEmpty && index > 0) {
                              // Move cursor to previous TextField
                              FocusScope.of(context).previousFocus();
                            } else if (value.length == 1 && index < 3) {
                              // Move cursor to next TextField
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text(
                      'Code expires in: ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      _otpController.getFormattedTime(),
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: _resendEnabled ? _otpController.sendOTP : null,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      backgroundColor: _resendEnabled
                          ? const Color(0xFFEAE3FC)
                          : Colors.grey, // Set background color
                    ),
                    child: Text(
                      'Send Again',
                      style: TextStyle(
                        color: _resendEnabled
                            ? const Color(0xFF75A4FE)
                            : Colors.grey, // Set text color
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity, // Set width
                  height: 58, // Set height
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      backgroundColor:
                          const Color(0xFF75A4FE), // Set background color
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white, // Set text color
                        fontSize: 18, // Set font size
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _otpController.stopTimer();
    super.dispose();
  }
}
