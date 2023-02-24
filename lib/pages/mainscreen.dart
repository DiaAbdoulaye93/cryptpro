import 'package:cryptpro/widgets/mainscreenwidget.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

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
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            CircleAvatar(backgroundImage: AssetImage("assets/omzo.jpeg"))
          ],
        ),
        Container(
          padding: const EdgeInsets.only(top: 40, bottom: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "1 235 975",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white),
              ),
              Text(
                "  Fcfa",
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
                ),
              ),
              VerticalDivider(),
              Text('+1250 Ffca',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ],
          )),
        ),
        Container(
          padding: const EdgeInsets.only(top: 30, left: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                    'Receive',
                    style: TextStyle(color: Color.fromARGB(183, 255, 255, 255)),
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
                    'Send',
                    style: TextStyle(color: Color.fromARGB(183, 255, 255, 255)),
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
                    'swap',
                    style: TextStyle(color: Color.fromARGB(183, 255, 255, 255)),
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
                    'Buy',
                    style: TextStyle(color: Color.fromARGB(183, 255, 255, 255)),
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
                    'Sell',
                    style: TextStyle(color: Color.fromARGB(183, 255, 255, 255)),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top:20,left:35),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: const[
                Text("My whislist",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white)),
                Text("Voir tout",style: TextStyle(fontSize: 10,fontWeight:FontWeight.bold,color: Colors.white)),
               ],
                ),
                CadreAccueil(icone: Icon(Icons.currency_bitcoin_outlined,color: Colors.amber,),NomCrypto:"Bitcoin",avoir: " 32 500",codeCrypto: "BTC",fluctation: "4",)
            ],
          ),
        )
    
      ]),

    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
