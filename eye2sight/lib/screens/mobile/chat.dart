import 'package:flutter/material.dart';
import 'package:eye2sight/widgets/app_bars/profile_app_bar.dart';
import 'package:eye2sight/screens/mobile/widgets/bar_chart.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    // Use a unique tag for this instance of the Chart widget
    String heroTag = 'attendance_chart_chat';

    return Scaffold(
      appBar: ProfileAppBar(
        userName: 'John Doe',
        profilePhotoUrl:
            'https://s3-alpha-sig.figma.com/img/5283/b1fa/af8a5eb8ab2138e7b9bd563fd4e346eb?Expires=1713139200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=NXZLLglRQehR9JfrxNvYm7wa0SaNJ8U~480VI92ZymfCNxHbQ7sT8X4BsbL0uTs~i9uKd8SIlCVdL-Wo8xQLBR17DkaZRt3zZMshuSC3OOU~DlhMzcVzhQfCOVZ-jj8NyheQQddeQ~kJJ0O-5Mwuz1QQIODW1855QsA0MH2CtX~FcRRzPiAIfWrsMJ8u7SAwb2F3JgXsXPIIstTGuxAvqIyupvFTlAJOEXmmeAl94zRIu6yRXIzRbzAmWFRwPYXSbjntYbeQem9INURqYMVFC0Zndn7nbSrBmTi9Up5qozmkd9pTxrHr~jHzExg46YbjC~wH12sDNrCv7d6QjIQkcg__',
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
            const Text(
              "Attendance Report",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            Hero(
              tag: heroTag, // Unique hero tag
              child: Chart.withSampleData(),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Overall Percentage",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
                Text(
                  ' 82.6%',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Days",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "30",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Present Days",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "25",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Absent Days",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "5",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              " Keep Up the Good work !",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
