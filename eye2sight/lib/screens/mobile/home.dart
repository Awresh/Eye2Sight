import 'package:eye2sight/constants/getstorage_keys_constants.dart';
import 'package:flutter/material.dart';
import 'package:eye2sight/screens/mobile/widgets/attendance_chart.dart';
import 'package:eye2sight/widgets/app_bars/profile_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    final token1 = box.read(GetStorageKeys.accessToken);
    print(token1);
    return Scaffold(
      appBar: ProfileAppBar(
        userName: 'John Doe', // Replace with actual user name
        profilePhotoUrl:
            'https://s3-alpha-sig.figma.com/img/5283/b1fa/af8a5eb8ab2138e7b9bd563fd4e346eb?Expires=1713139200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=NXZLLglRQehR9JfrxNvYm7wa0SaNJ8U~480VI92ZymfCNxHbQ7sT8X4BsbL0uTs~i9uKd8SIlCVdL-Wo8xQLBR17DkaZRt3zZMshuSC3OOU~DlhMzcVzhQfCOVZ-jj8NyheQQddeQ~kJJ0O-5Mwuz1QQIODW1855QsA0MH2CtX~FcRRzPiAIfWrsMJ8u7SAwb2F3JgXsXPIIstTGuxAvqIyupvFTlAJOEXmmeAl94zRIu6yRXIzRbzAmWFRwPYXSbjntYbeQem9INURqYMVFC0Zndn7nbSrBmTi9Up5qozmkd9pTxrHr~jHzExg46YbjC~wH12sDNrCv7d6QjIQkcg__', // Replace with actual profile photo URL
        onNotificationPressed: () {
          // Handle notification icon press
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  backgroundColor: const Color(0xFF75A4FE),
                ),
                child: const Text(
                  'Mark Attendance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const AttendanceReportWidget()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed logic here
        },
        backgroundColor: Colors.blue,
        elevation: 0,
        shape: const CircleBorder(), // Remove shadow
        child: Image.asset(
          'images/floating.png', // Replace with actual image path
          width: 45, // Adjust size as needed
          height: 45, // Adjust size as needed
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
