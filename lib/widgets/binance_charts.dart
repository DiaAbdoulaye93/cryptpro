import 'package:cryptpro/widgets/popup.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';

class BinanceCharts extends StatefulWidget {
  const BinanceCharts({super.key});

  // This widget is the root of your application.
  @override
  BinanceChartsState createState() {
    return BinanceChartsState();
  }
}

class BinanceChartsState extends State<BinanceCharts> {
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;
  String counter = "188300"; // Create a counter to maintain the number
  late Timer timer;
  @override
  void initState() {
    var formatter = NumberFormat("#,###,000", "fr_FR");
    chartData = getChartData();
    Timer.periodic(const Duration(seconds: 2), updateDataSource);
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      // Timer.periodic runs every 100 ms and updates the state
      setState(() {
        // counter = formatter.format(16987) as int ;
        counter = formatter.format(187000 + math.Random().nextInt(1000));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> color = <Color>[];
    color.add(Colors.green[50]!);
    color.add(Color.fromARGB(255, 215, 231, 145));
    color.add(Color.fromARGB(255, 255, 255, 255));

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors =
        LinearGradient(colors: color, stops: stops);
    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
                child: Column(
              children: [
                Text("Prix du Binance en Cours",
                    style: TextStyle(fontSize: 25, color: Colors.white)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$counter',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                    Text(
                      "  Xof",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                    Text(
                      ' =  1',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),  
                     Icon(CryptoFontIcons.BAY,
                            color: Colors.amber, size: 25,)
                  ],
                )
              ],
            )),
            SfCartesianChart(
                series: <ChartSeries<LiveData, int>>[
                  AreaSeries<LiveData, int>(
                    borderColor:  Colors.yellowAccent,
                    borderWidth: 5,
                    gradient: gradientColors,
                    onRendererCreated: (ChartSeriesController controller) {
                      _chartSeriesController = controller;
                    },
                    dataSource: chartData,
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
                    minimum: 180000,
                    interval: 2000,
                    tickPosition: TickPosition.inside,
                    axisLine: const AxisLine(width: 0),
                    majorTickLines: const MajorTickLines(size: 0),
                    title: AxisTitle(
                        text: "Variation prix du Binance en Xof",
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
                        '187 230 Xof',
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
                        '187 000 Xof',
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
                        '186 000 Xof - 192 000 Xof ',
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
                        "Nombre BTC ",
                        style: TextStyle(
                            color: Color.fromARGB(235, 214, 207, 207),
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1.2),
                      ),
                      Text(
                        '3 BN = 566 394 Xof',
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
                            builder: (context) => DialogExample(
                                  title: "BINANCE",
                                  priceLabel: "Prix unitaire",
                                  price: "188 798 Xof ",
                                  shadowColor: Color.fromRGBO(202, 249, 156, 1),
                                ));
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
                            builder: (context) => DialogExample(
                                  title: "BINANCE",
                                  priceLabel: "Prix unitaire",
                                  price: "188 798 Xof ",
                                  shadowColor: Color.fromRGBO(245, 137, 101, 1),
                                ));
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
    chartData.add(LiveData(time++, (187000 + math.Random().nextInt(1000))));
    chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  }

  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(0, 186000),
      LiveData(1, 186200),
      LiveData(2, 186800),
      LiveData(3, 189000),
      LiveData(4, 187200),
      LiveData(5, 187000),
      LiveData(6, 188000),
      LiveData(7, 189000),
      LiveData(8, 188100),
      LiveData(9, 188400),
      LiveData(10, 187250),
      LiveData(11, 186900),
      LiveData(12, 187500),
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
