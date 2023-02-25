import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

class CadreAccueil extends StatelessWidget {
  Icon icone;
  String NomCrypto;
  String avoir;
  String codeCrypto;
  String fluctation;
  String BottomSetTitle;
  Color colorFluctation;
  Icon iconeFluctation;
  // Widget BottomSetContent;
  CadreAccueil({
    super.key,
    required this.icone,
    required this.NomCrypto,
    required this.avoir,
    required this.codeCrypto,
    required this.colorFluctation,
    required this.fluctation,
    required this.iconeFluctation,
    this.BottomSetTitle = "teste",
    // required this.BottomSetContent,
  });
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromRGBO(52, 51, 58, 1)),
        child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              )),
              padding:
                  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(25)),
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Color.fromRGBO(52, 51, 58, 2)),
              elevation: MaterialStateProperty.all(6),
            ),
            onPressed: () {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                    top: Radius.circular(7.0),
                  )),
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.only(top: 6.0),
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(7.0)),
                        color: Color.fromRGBO(4, 79, 120, 1),
                      ),
                      height: 400,
                      child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(7.0),
                            ),
                            color: Colors.white,
                          ),
                          child: ListView(shrinkWrap: true, children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.navigate_before),
                                  onPressed: () {
                                    // Do something when the button is pressed
                                    Navigator.pop(context);
                                  },
                                ),
                                Text(
                                  BottomSetTitle,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Segoe UI'),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () {
                                    // Do something when the button is pressed
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                            Text("Contenu de modal du bas")
                          ])),
                    );
                  });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12)),
                          child: IconButton(
                              onPressed: () {
                                const Text("hello");
                              },
                              icon: icone)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(NomCrypto),
                          Text(
                            codeCrypto,
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(avoir),
                    Row(
                      children: [
                        Text(
                          fluctation,
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: colorFluctation),
                          textAlign: TextAlign.center,
                        ),
                        iconeFluctation
                      ],
                    )
                  ],
                )
              ],
            )));
  }
}
