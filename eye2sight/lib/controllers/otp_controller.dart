import 'dart:async';

class OTPController {
  late Timer _timer;
  late int _remainingTime;
  late Function() _onTimerTick;
  late Function() _onResendEnabled;

  OTPController(
      int initialTime, Function() onTimerTick, Function() onResendEnabled) {
    _remainingTime = initialTime;
    _onTimerTick = onTimerTick;
    _onResendEnabled = onResendEnabled;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _onTimerTick();
    });
  }

  void stopTimer() {
    _timer.cancel();
  }

  void sendOTP() {
    // Logic to send OTP
    _onResendEnabled();
  }

  String getFormattedTime() {
    int minutes = _remainingTime ~/ 60;
    int seconds = _remainingTime % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

  void decrementTime() {
    _remainingTime--;
  }
}
