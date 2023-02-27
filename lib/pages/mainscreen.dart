import 'package:cryptpro/widgets/binance_charts.dart';
import 'package:cryptpro/widgets/cgf_charts.dart';
import 'package:cryptpro/widgets/mainscreenwidget.dart';
import 'package:flutter/material.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';

import '../widgets/bitcoin_charts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(1, 1, 2, 0.357),
        appBar: AppBar(
            backgroundColor: Colors.black,
            toolbarHeight: 120,
            title: Container(
                padding: const EdgeInsets.all(2.0),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      IconButton(
                          icon:  const Icon(Icons.arrow_back),
                          onPressed: () {
                            // Do something when the button is pressed
                            Navigator.pop(context);
                          }),
                      const CircleAvatar(
                          backgroundImage: AssetImage("assets/mamoudou.jpeg"))
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "1 235 975",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white),
                        ),
                        Text(
                          "  Xof",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 22,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(202, 249, 156, 2),
                        borderRadius: BorderRadius.circular(30)),
                    child: IntrinsicHeight(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const <Widget>[
                        Text(
                          '+5.25%',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.black),
                        ),
                        VerticalDivider(),
                        Text('+1250 Ffca',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Colors.black)),
                      ],
                    )),
                  ),
                ]))),
        body: Container(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30, left: 40, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 7),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: IconButton(
                              onPressed: () {
                                const Text("hello");
                              },
                              icon: const Icon(Icons.call_received))),
                      const Text(
                        'Retraits',
                        style: TextStyle(
                            color: Color.fromARGB(183, 255, 255, 255)),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 7),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: IconButton(
                              onPressed: () {
                                const Text("hello");
                              },
                              icon: const Icon(Icons.call_made))),
                      const Text(
                        'Envoies',
                        style: TextStyle(
                            color: Color.fromARGB(183, 255, 255, 255)),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 7),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: IconButton(
                              onPressed: () {
                                const Text("hello");
                              },
                              icon: const Icon(Icons.swap_vert_sharp))),
                      const Text(
                        'Echanges',
                        style: TextStyle(
                            color: Color.fromARGB(183, 255, 255, 255)),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 7),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: IconButton(
                              onPressed: () {
                                const Text("hello");
                              },
                              icon: const Icon(Icons.call_received_sharp))),
                      const Text(
                        'Achats',
                        style: TextStyle(
                            color: Color.fromARGB(183, 255, 255, 255)),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 7),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: IconButton(
                              onPressed: () {
                                const Text("hello");
                              },
                              icon: const Icon(Icons.sell_outlined))),
                      const Text(
                        'Ventes',
                        style: TextStyle(
                            color: Color.fromARGB(183, 255, 255, 255)),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 500,
              margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("En tendance",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text("Voir tout",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                  ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      CadreAccueil(
                          icone: const Icon(
                            Icons.bar_chart_sharp,
                            color: Colors.grey,
                          ),
                          NomCrypto: "CGF Bourse",
                          avoir: " 75 000",
                          codeCrypto: "CGFB",
                          fluctation: "+ 6,5 %",
                          colorFluctation: Colors.lightGreenAccent,
                          iconeFluctation: const Icon(Icons.arrow_upward,
                              color: Colors.lightGreenAccent, size: 12),
                          BottomSetContent: const Charts(),
                          BottomSetTitle: "CGF  BOURSE"),
                      CadreAccueil(
                          icone: const Icon(
                            Icons.currency_bitcoin_outlined,
                            color: Colors.amber,
                          ),
                          NomCrypto: "Bitcoin",
                          avoir: " 10 000",
                          codeCrypto: "BTC",
                          fluctation: "- 2,7 %",
                          colorFluctation: Colors.red,
                          iconeFluctation: const Icon(Icons.arrow_downward,
                              color: Colors.red, size: 12),
                          BottomSetContent: const BitcoinCharts(),
                          BottomSetTitle: "BITCOIN"),
                      CadreAccueil(
                          icone: const Icon(
                            CryptoFontIcons.BAY,
                            color: Colors.blue,
                          ),
                          NomCrypto: "Binance",
                          avoir: " 6 250",
                          codeCrypto: "BNB",
                          fluctation: "1 %",
                          colorFluctation: Colors.red,
                          iconeFluctation: const Icon(Icons.arrow_downward,
                              color: Colors.red, size: 12),
                          BottomSetContent: const BinanceCharts(),
                          BottomSetTitle: "BINANCE"),
                      CadreAccueil(
                          icone: const Icon(
                            CryptoFontIcons.ETH,
                            color: Colors.amber,
                          ),
                          NomCrypto: "Etherium",
                          avoir: " 32 500",
                          codeCrypto: "ETH",
                          fluctation: "+ 4 %",
                          colorFluctation: Colors.lightGreenAccent,
                          iconeFluctation: const Icon(Icons.arrow_upward,
                              color: Colors.lightGreenAccent, size: 12),
                          BottomSetContent: const Charts()),
                      CadreAccueil(
                          icone: const Icon(
                            CryptoFontIcons.BRK,
                            color: Colors.red,
                          ),
                          NomCrypto: "BRVM",
                          avoir: " 40 000",
                          codeCrypto: "BRVM",
                          fluctation: "+ 0.1 %",
                          colorFluctation: Colors.lightGreenAccent,
                          iconeFluctation: const Icon(Icons.arrow_upward,
                              color: Colors.lightGreenAccent, size: 12),
                          BottomSetContent: const Charts()),
                      CadreAccueil(
                          icone: const Icon(
                            CryptoFontIcons.DGX,
                            color: Colors.white,
                          ),
                          NomCrypto: "DAX",
                          avoir: " 162 500",
                          codeCrypto: "DAX",
                          fluctation: "+ 2.9 %",
                          colorFluctation: Colors.lightGreenAccent,
                          iconeFluctation: const Icon(Icons.arrow_upward,
                              color: Colors.lightGreenAccent, size: 12),
                          BottomSetContent: const Charts()),
                      CadreAccueil(
                          icone: const Icon(
                            CryptoFontIcons.CLAM,
                            color: Colors.greenAccent,
                          ),
                          NomCrypto: "BEL20 INDEX",
                          avoir: " 35 000",
                          codeCrypto: "BI20",
                          fluctation: "- 0.9 %",
                          colorFluctation: Colors.red,
                          iconeFluctation: const Icon(Icons.arrow_downward,
                              color: Colors.red, size: 12),
                          BottomSetContent: const Charts()),

                            CadreAccueil(
                          icone: const Icon(
                            CryptoFontIcons.CLOAK,
                            color: Colors.greenAccent,
                          ),
                          NomCrypto: "CAC 40",
                          avoir: " 99 000",
                          codeCrypto: "CAC 40",
                          fluctation: "- 0.9 %",
                          colorFluctation: Colors.red,
                          iconeFluctation: const Icon(Icons.arrow_downward,
                              color: Colors.red, size: 12),
                          BottomSetContent: const Charts()),



                            CadreAccueil(
                          icone: const Icon(
                            CryptoFontIcons.SJCX,
                            color: Colors.purple,
                          ),
                          NomCrypto: "SDF 120",
                          avoir: " 9 000",
                          codeCrypto: " SDF 120",
                          fluctation: "- 0.9 %",
                          colorFluctation: Colors.red,
                          iconeFluctation: const Icon(Icons.arrow_downward,
                              color: Colors.red, size: 12),
                          BottomSetContent: const Charts()),




                            CadreAccueil(
                          icone: const Icon(
                            CryptoFontIcons.NXT,
                            color: Colors.yellowAccent,
                          ),
                          NomCrypto: "NEXT BIOTEC",
                          avoir: " 199 100",
                          codeCrypto: "NB",
                          fluctation: "- 0.9 %",
                          colorFluctation: Colors.red,
                          iconeFluctation: const Icon(Icons.arrow_downward,
                              color: Colors.red, size: 12),
                          BottomSetContent: const Charts()),



                            CadreAccueil(
                          icone: const Icon(
                            CryptoFontIcons.ICN,
                            color: Colors.blueGrey,
                          ),
                          NomCrypto: "AEX25 INDEX",
                          avoir: " 930 000",
                          codeCrypto: "AI25",
                          fluctation: "- 0.9 %",
                          colorFluctation: Colors.red,
                          iconeFluctation: const Icon(Icons.arrow_downward,
                              color: Colors.red, size: 12),
                          BottomSetContent: const Charts()),


                            CadreAccueil(
                          icone: const Icon(
                            CryptoFontIcons.LSK,
                            color: Colors.lime,
                          ),
                          NomCrypto: "LISI",
                          avoir: " 2 030 000",
                          codeCrypto: "CAC 40",
                          fluctation: "- 0.75 %",
                          colorFluctation: Colors.red,
                          iconeFluctation: const Icon(Icons.arrow_downward,
                              color: Colors.red, size: 12),
                          BottomSetContent: const Charts()),
                    ],
                  )
                ],
              ),
            ),
          ],
        )),
        bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(1, 1, 2, 0.357),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_sharp),
              label: 'Accueil',
            ),
           
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded),
              label: 'Assistance',
            ),
          ],
          selectedItemColor: const Color.fromRGBO(202, 249, 156, 2),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
