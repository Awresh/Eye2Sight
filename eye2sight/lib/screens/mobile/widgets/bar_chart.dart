import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Chart extends StatelessWidget {
  final List<charts.Series<OrdinalSales, String>> seriesList;
  final bool animate;

  const Chart(this.seriesList, {super.key, required this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory Chart.withSampleData() {
    return Chart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350, // Adjust the height as needed
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width *
                2, // Adjust the width of the chart
            child: charts.BarChart(
              seriesList,
              animate: animate,
              barGroupingType: charts.BarGroupingType.grouped,
              defaultRenderer: charts.BarRendererConfig(
                minBarLengthPx: 10, // Set minimum bar length to avoid overlap
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      OrdinalSales('January', 65),
      OrdinalSales('February', 70),
      OrdinalSales('March', 80),
      OrdinalSales('April', 5),
      OrdinalSales('May', 25),
      OrdinalSales('June', 100),
      OrdinalSales('July', 75),
      OrdinalSales('August', 55), // Replace with your sales value
      OrdinalSales('September', 35), // Replace with your sales value
      OrdinalSales('October', 45), // Replace with your sales value
      OrdinalSales('November', 60), // Replace with your sales value
      OrdinalSales('December', 62), // Replace with your sales value
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, index) {
          // Alternating bar colors
          return index != null && index.isEven
              ? charts.ColorUtil.fromDartColor(const Color(0xFF142E40))
              : charts.ColorUtil.fromDartColor(const Color(0xFF71A8D6));
        },
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String month;
  final int sales;

  OrdinalSales(this.month, this.sales);
}
