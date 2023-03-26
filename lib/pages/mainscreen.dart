import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:cryptpro/data/Model/walletModel.dart';
import 'package:cryptpro/pages/retraits.dart';
import 'package:cryptpro/widgets/binance_charts.dart';
import 'package:cryptpro/widgets/cgf_charts.dart';
import 'package:cryptpro/widgets/mainscreenwidget.dart';
import 'package:cryptpro/widgets/modalTopSet.dart';
import 'package:flutter/material.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import '../data/commonrequest.dart';
import '../widgets/bitcoin_charts.dart';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  @override
      late double TotalWallet = 0.0;
  void initState() {
    super.initState();
    getAmount();
  }
var formatter = NumberFormat("#,###,000", "fr_FR");
 getAmount() async {
          var  result = await getPublicData2("list-wallets");
           setState(() {
          for (var element in result) {
            TotalWallet = TotalWallet + element['taux'] * element['montant'];
          }
          });
        }   

  // The function that fetches data from the API

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
                    children: [
                      IconButton(
                          icon: const Icon(Icons.arrow_back),
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
                      children: [
                        Text(
                          formatter.format(TotalWallet),
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
                                showTopModalSheet(context,
                                    ModalTopSet(TopSetContent: RetraitForm()));
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
                  FutureBuilder<List>(
                    future: getPublicData("list-wallets"),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            double montantCfa = snapshot.data![index].montant *
                                snapshot.data![index].taux;

                            return CadreAccueil(
                                icone: Icon(
                                  IconData(
                                      int.parse(snapshot.data![index]?.icone),
                                      fontFamily: 'MaterialIcons'),
                                  color: Colors.grey,
                                ),
                                NomCrypto:
                                    snapshot.data![index].name.toString(),
                                avoir:
                                    "${snapshot.data![index].montant} ( ${formatter.format(montantCfa)} Xof) ",
                                codeCrypto:
                                    snapshot.data![index].code.toString(),
                                fluctation: "+ 6,5 %",
                                colorFluctation: Colors.lightGreenAccent,
                                iconeFluctation: const Icon(Icons.arrow_upward,
                                    color: Colors.lightGreenAccent, size: 12),
                                BottomSetContent: const Charts(),
                                BottomSetTitle: "CGF  BOURSE");
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
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



