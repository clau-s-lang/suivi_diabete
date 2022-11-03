import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/scheduler.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

import '../modeles/modelChart.dart';

//Holds the data source of chart
class HistoriqueSigne extends StatefulWidget {
  @override
  _HistoriqueSigneState createState() => _HistoriqueSigneState();
}

class _HistoriqueSigneState extends State<HistoriqueSigne> {
  @override
  List<ChartData> chartData = <ChartData>[];

  @override
  void initState() {
    getDataFromFireStore().then((results) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {});
      });
    });
    super.initState();
  }

  Future<void> getDataFromFireStore() async {
    var snapShotsValue =
        await FirebaseFirestore.instance.collection("chartData").get();
    List<ChartData> list = snapShotsValue.docs
        .map((e) => ChartData(
            x: DateTime.fromMillisecondsSinceEpoch(
                e.data()['x'].millisecondsSinceEpoch),
            y: e.data()['y']))
        .toList();
    setState(() {
      chartData = list;
    });
  }

// Class for chart data source, this can be modified based on the data in Firestore
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historique des données'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body: SfCartesianChart(
          primaryXAxis: DateTimeAxis(),
          primaryYAxis: NumericAxis(),
          series: <ChartSeries<ChartData, DateTime>>[
            LineSeries<ChartData, DateTime>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y),
          ]),
    );
  }
}
