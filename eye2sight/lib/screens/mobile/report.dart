import 'package:eye2sight/widgets/app_bars/tital_app_bar.dart';
import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> dummyData = [
      {
        'Date': '01-01-2022',
        'In': '09:00 AM',
        'Out': '05:00 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:15 AM',
        'Out': '05:30 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:00 AM',
        'Out': '05:00 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:15 AM',
        'Out': '05:30 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:00 AM',
        'Out': '05:00 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:15 AM',
        'Out': '05:30 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:00 AM',
        'Out': '05:00 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:15 AM',
        'Out': '05:30 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:00 AM',
        'Out': '05:00 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:15 AM',
        'Out': '05:30 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:00 AM',
        'Out': '05:00 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:15 AM',
        'Out': '05:30 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:00 AM',
        'Out': '05:00 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:15 AM',
        'Out': '05:30 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:00 AM',
        'Out': '05:00 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:15 AM',
        'Out': '05:30 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:00 AM',
        'Out': '05:00 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:15 AM',
        'Out': '05:30 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:00 AM',
        'Out': '05:00 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:15 AM',
        'Out': '05:30 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:00 AM',
        'Out': '05:00 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:15 AM',
        'Out': '05:30 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:00 AM',
        'Out': '05:00 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:15 AM',
        'Out': '05:30 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:00 AM',
        'Out': '05:00 PM',
        'WH': '08:30',
        'S': 'S',
      },
      {
        'Date': '01-01-2022',
        'In': '09:15 AM',
        'Out': '05:30 PM',
        'WH': '08:30',
        'S': 'S',
      },
      // Add more dummy data as needed
    ];

    return Scaffold(
      appBar: const TitalAppBar(title: 'Report'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Start Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF75A4FE),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.zero, // Remove padding
                        child: GestureDetector(
                          onTap: () async {
                            final pickedStartDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now(),
                            );
                            if (pickedStartDate != null) {
                              setState(() {
                                startDate = pickedStartDate;
                              });
                            }
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFA4A4A4),
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Center(
                              child: Text(
                                startDate != null
                                    ? '${startDate!.day}/${startDate!.month}/${startDate!.year}'
                                    : 'Select Start Date',
                                style: const TextStyle(
                                  color: Color(0xFFA4A4A4),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'End Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF75A4FE),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.zero, // Remove padding
                        child: GestureDetector(
                          onTap: () async {
                            final pickedEndDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now(),
                            );
                            if (pickedEndDate != null) {
                              setState(() {
                                endDate = pickedEndDate;
                              });
                            }
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFA4A4A4),
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Center(
                              child: Text(
                                endDate != null
                                    ? '${endDate!.day}/${endDate!.month}/${endDate!.year}'
                                    : 'Select End Date',
                                style: const TextStyle(
                                  color: Color(0xFFA4A4A4),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(''), //Empty Text widget
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        backgroundColor: const Color(0xFF75A4FE),
                      ),
                      child: const Text(
                        'Go',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 1),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: DataTable(
                    columnSpacing: 20,
                    headingRowHeight: 40,
                    dataRowHeight: 30,
                    headingRowColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 114, 118, 119)),
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Date',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'In',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Out',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'WH',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'S',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                    rows: dummyData.map((data) {
                      int index = dummyData.indexOf(data); // Get row index
                      bool isEven = index % 2 == 0;
                      return DataRow(
                        cells: [
                          DataCell(
                            Text(
                              data['Date']!,
                              style: const TextStyle(
                                color: Color(0xFFA4A4A4),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          DataCell(
                            Text(
                              data['In']!,
                              style: const TextStyle(
                                color: Color(0xFFA4A4A4),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          DataCell(
                            Text(
                              data['Out']!,
                              style: const TextStyle(
                                color: Color(0xFFA4A4A4),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          DataCell(
                            Text(
                              data['WH']!,
                              style: const TextStyle(
                                color: Color(0xFFA4A4A4),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          DataCell(
                            Text(
                              data['S']!,
                              style: const TextStyle(
                                color: Color(0xFFA4A4A4),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                        color: !isEven
                            ? MaterialStateProperty.all(
                                const Color.fromARGB(255, 236, 235, 235))
                            : null,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
