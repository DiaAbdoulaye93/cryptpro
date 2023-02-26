import 'package:cryptpro/widgets/popup.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';
import 'dart:math' as math;

class Charts extends StatefulWidget {
  const Charts({super.key});

  // This widget is the root of your application.
  @override
  ChartsState createState() {
    return ChartsState();
  }
}

class ChartsState extends State<Charts> {
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;
  int counter = 3000; // Create a counter to maintain the number
  late Timer timer;
  @override
  void initState() {
    chartData = getChartData();
    Timer.periodic(const Duration(seconds: 2), updateDataSource);
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      // Timer.periodic runs every 100 ms and updates the state
      setState(() {
        counter = 3000 + math.Random().nextInt(300);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
                child: Column(
              children: [
                Text("Prix de l'action en cours",
                    style: TextStyle(fontSize: 25, color: Colors.white)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$counter',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white),
                    ),
                    Text(
                      "  Xof",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ],
                )
              ],
            )),
            SfCartesianChart(
                series: <LineSeries<LiveData, int>>[
                  LineSeries<LiveData, int>(
                    onRendererCreated: (ChartSeriesController controller) {
                      _chartSeriesController = controller;
                    },
                    dataSource: chartData,
                    color: const Color.fromRGBO(192, 108, 132, 1),
                    xValueMapper: (LiveData sales, _) => sales.time,
                    yValueMapper: (LiveData sales, _) => sales.speed,
                  )
                ],
                primaryXAxis: NumericAxis(
                  isVisible: false,
                  majorGridLines: const MajorGridLines(width: 0),
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  interval: 0.1,
                ),
                primaryYAxis: NumericAxis(
                    minimum: 2500,
                    interval: 150,
                    tickPosition: TickPosition.inside,
                    axisLine: const AxisLine(width: 0),
                    majorTickLines: const MajorTickLines(size: 0),
                    title: AxisTitle(
                        text: "Variation prix de l'action CGF bourse",
                        textStyle: const TextStyle(
                            color: Color.fromARGB(235, 214, 207, 207))))),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 13, bottom: 20, left: 20),
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 13, bottom: 20),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: Color.fromARGB(235, 214, 207, 207)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Prix d'ouverture",
                        style: TextStyle(
                            color: Color.fromARGB(235, 214, 207, 207),
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1.2),
                      ),
                      Text(
                        '3 000 Xof',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: Color.fromARGB(235, 214, 207, 207)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Prix de clôture précédent",
                        style: TextStyle(
                            color: Color.fromARGB(235, 214, 207, 207),
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1.2),
                      ),
                      Text(
                        '2 870 Xof',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: Color.fromARGB(235, 214, 207, 207)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "plage hebdomadaire",
                        style: TextStyle(
                            color: Color.fromARGB(235, 214, 207, 207),
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1.2),
                      ),
                      Text(
                        '2 850 Xof - 3 500 Xof ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Volume",
                        style: TextStyle(
                            color: Color.fromARGB(235, 214, 207, 207),
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1.2),
                      ),
                      Text(
                        '465 CGF',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => DialogExample(title: "CGF BOURSE",priceLabel: "Prix unitaire",price: "3079 Xof ", shadowColor:Color.fromRGBO(202, 249, 156, 1) ,));
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 55),
                        backgroundColor: Color.fromRGBO(202, 249, 156, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        "Acheter",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => DialogExample(title: "CGF BOURSE",priceLabel: "Prix unitaire",price: "3079 Xof ", shadowColor:Color.fromRGBO(245, 137, 101, 1) ,));
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 55),
                        backgroundColor: Color.fromRGBO(245, 137, 101, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        "Vendre",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ));
  }

  int time = 13;
  void updateDataSource(Timer timer) {
    chartData.add(LiveData(time++, (3000 + math.Random().nextInt(300))));
    chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  }

  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(0, 2500),
      LiveData(1, 2700),
      LiveData(2, 3000),
      LiveData(3, 2500),
      LiveData(4, 3000),
      LiveData(5, 3100),
      LiveData(6, 3000),
      LiveData(7, 2800),
      LiveData(8, 2600),
      LiveData(9, 3000),
      LiveData(10, 2700),
      LiveData(11, 3000),
      LiveData(12, 3200),
      // LiveData(13, 7500),
      // LiveData(14, 8000),
      // LiveData(15, 8500),
      // LiveData(16, 9000),
      // LiveData(17, 9500),
      // LiveData(18, 1000)
    ];
  }
}

class LiveData {
  LiveData(this.time, this.speed);
  final int time;
  final num speed;
}
