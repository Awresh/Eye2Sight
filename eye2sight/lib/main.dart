import 'package:eye2sight/constants/getstorage_keys_constants.dart';
import 'package:eye2sight/controllers/conectivity_controller.dart';
import 'package:eye2sight/screens/mobile/account/login/login_page.dart';
import 'package:eye2sight/screens/mobile/onboarding/onbording.dart';
import 'package:eye2sight/widgets/bottom_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure WidgetsBinding is initialized
  await GetStorage.init(); // Initialize GetStorage
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ConnectivityController());
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Use SplashScreen as the initial route
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage(); // Access local storage

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      checkToken(); // Check token after the first frame is built
    });
  }

  Future<void> checkToken() async {
    await GetStorage.init(); // Ensure GetStorage is initialized
    final token = box.read(GetStorageKeys.accessToken);
    final onboardingIsCompleted =
        box.read(GetStorageKeys.onboardingIsCompleted);
    print(token); // Read token from local storage
    if (token != null && !JwtDecoder.isExpired(token)) {
      // Token exists and is not expired

      Get.offAll(() => BottomNavBar()); // Navigate to BottomNavBar
    } else {
      if (onboardingIsCompleted != null && onboardingIsCompleted == 1) {
        Get.offAll(() => const LoginPage());
      } else {
        Get.offAll(() => Onboarding());
      }
      // Token doesn't exist or is expired
      // Navigate to LoginPage
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
