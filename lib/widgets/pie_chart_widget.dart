import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartWidget extends StatelessWidget {
  final Map<String, double> dataMap;

  PieChartWidget({required this.dataMap});

  @override
  Widget build(BuildContext context) {
    if (dataMap.isEmpty) {
      return const Center(
        child: Text(
          'Add expenses to track \n Use + button to add new expenses',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return SfCircularChart(
      series: <CircularSeries>[
        PieSeries<PieChartData, String>(
          dataSource: _prepareChartData(),
          xValueMapper: (PieChartData data, _) => data.category,
          yValueMapper: (PieChartData data, _) => data.amount,
          dataLabelMapper: (datum, index) =>
              "${datum.category} ₹${datum.amount}",
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
            labelPosition: ChartDataLabelPosition.inside,
          ),
        ),
      ],
    );
  }

  List<PieChartData> _prepareChartData() {
    List<PieChartData> chartDataList = [];
    dataMap.forEach((category, amount) {
      chartDataList.add(PieChartData(category: category, amount: amount));
    });
    return chartDataList;
  }
}

class PieChartData {
  final String category;
  final double amount;

  PieChartData({required this.category, required this.amount});
}
