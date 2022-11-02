import 'package:flutter/material.dart';
import '../menus/pageMenuMedecin.dart';
import 'package:gestion_diabete/style/styleChart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
      ChartData(17, 89),
      ChartData(18, 134),
      ChartData(19, 97),
      ChartData(20, 72),
      ChartData(21, 150),
      ChartData(22, 200),
      ChartData(23, 230),
      ChartData(24, 86),
      ChartData(25, 134),
      ChartData(26, 223),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.bg_color,
      drawer: MenuMedecin(),
      appBar: AppBar(
        title: Text('Historique'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              'Evolution de la glycémie',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: SfCartesianChart(
              margin: EdgeInsets.all(0),
              borderWidth: 0,
              borderColor: Colors.transparent,
              plotAreaBorderWidth: 0,
              primaryXAxis: NumericAxis(
                minimum: 16,
                maximum: 27,
                isVisible: true,
                interval: 1,
                borderWidth: 0,
                borderColor: Colors.transparent,
              ),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 300,
                isVisible: true,
                interval: 10,
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
