/*
import 'package:flutter/material.dart';
import 'package:gestion_diabete/style/styleChart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../menus/pageMenuPatient.dart';
import '../modeles/modelChart.dart';

class HistoriqueChart extends StatefulWidget {
  @override
  _HistoriqueChartState createState() => _HistoriqueChartState();
}

class _HistoriqueChartState extends State<HistoriqueChart> {
  late List<ChartData> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [
      ChartData(17, 21500),
      ChartData(18, 22684),
      ChartData(19, 21643),
      ChartData(20, 22997),
      ChartData(21, 22883),
      ChartData(22, 22635),
      ChartData(23, 21800),
      ChartData(24, 23500),
      ChartData(25, 21354),
      ChartData(26, 21354),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.bg_color,
      drawer: MenuPatient(),
      appBar: AppBar(
        title: Text('Historique'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SfCartesianChart(
              margin: EdgeInsets.all(0),
              borderWidth: 0,
              borderColor: Colors.transparent,
              plotAreaBorderWidth: 0,
              primaryXAxis: NumericAxis(
                minimum: 17,
                maximum: 26,
                isVisible: false,
                interval: 1,
                borderWidth: 0,
                borderColor: Colors.transparent,
              ),
              primaryYAxis: NumericAxis(
                minimum: 19000,
                maximum: 24000,
                isVisible: false,
                interval: 1000,
                borderWidth: 0,
                borderColor: Colors.transparent,
              ),
              series: <ChartSeries<ChartData, int>>[
                SplineAreaSeries(
                  dataSource: data,
                  xValueMapper: (ChartData data, _) => data.day,
                  yValueMapper: (ChartData data, _) => data.price,
                  splineType: SplineType.natural,
                  gradient: LinearGradient(
                    colors: [
                      AppStyle.spline_color,
                      AppStyle.bg_color.withAlpha(150),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                SplineSeries(dataSource: data,
                  color: AppStyle.accent_color,
                  width: 4,
                  markerSettings: MarkerSettings(
                    color: Colors.white,
                    borderWidth: 2,
                    shape: DataMarkerType.circle,
                    isVisible: true,
                    borderColor: AppStyle.accent_color,
                  ),
                  xValueMapper: (ChartData data, _) => data.day,
                  yValueMapper: (ChartData data, _) => data.price,)
              ],
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
*/
