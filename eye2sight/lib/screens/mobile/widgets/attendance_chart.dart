import 'package:eye2sight/constants/attendance_data.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AttendanceChart extends StatefulWidget {
  const AttendanceChart({super.key});

  @override
  State<AttendanceChart> createState() => _AttendanceChart();
}

class _AttendanceChart extends State<AttendanceChart> {
  final List<AttendanceDataConstants> _list =
      List<AttendanceDataConstants>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    _list.add(AttendanceDataConstants(key: "0", value: "2"));
    _list.add(AttendanceDataConstants(key: "1", value: "4"));
    _list.add(AttendanceDataConstants(key: "2", value: "6"));
    _list.add(AttendanceDataConstants(key: "3", value: "8"));
    _list.add(AttendanceDataConstants(key: "4", value: "10"));
    _list.add(AttendanceDataConstants(key: "5", value: "8"));
    _list.add(AttendanceDataConstants(key: "6", value: "4"));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            flex: 2,
            child: Container(
              color: const Color.fromARGB(255, 158, 64, 64),
              height: 100,
              width: 200,
            )),
        Expanded(
            flex: 2,
            child: Container(
              color: const Color.fromARGB(255, 173, 52, 52),
              height: 100,
              width: 200,
              child: BarChart(
                BarChartData(
                  backgroundColor: const Color.fromARGB(255, 102, 20, 20),
                  barGroups: _chartGroups(),
                  borderData: FlBorderData(
                      border: const Border(
                          bottom: BorderSide(), left: BorderSide())),
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                    leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toString(),
                          style: const TextStyle(fontSize: 10),
                        );
                      },
                    )),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                  ),
                ),
              ),
            )),
      ],
    );
  }

  List<BarChartGroupData> _chartGroups() {
    List<BarChartGroupData> list =
        List<BarChartGroupData>.empty(growable: true);
    for (int i = 0; i < _list.length; i++) {
      list.add(BarChartGroupData(x: i, barRods: [
        BarChartRodData(
            toY: double.parse(_list[i].value!), color: Colors.deepOrange)
      ]));
    }
    return list;
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 0:
              text = 'Mon';
              break;
            case 1:
              text = 'Tue';
              break;
            case 2:
              text = 'Wed';
              break;
            case 3:
              text = 'Thu';
              break;
            case 4:
              text = 'Fri';
              break;
            case 5:
              text = 'Sat';
              break;
            case 6:
              text = 'Sun';
              break;
          }

          return Text(
            text,
            style: const TextStyle(fontSize: 10),
          );
        },
      );
}
