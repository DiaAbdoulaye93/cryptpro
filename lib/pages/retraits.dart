import 'dart:developer';

import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

import '../data/commonrequest.dart';

class RetraitForm extends StatefulWidget {
  const RetraitForm({super.key});

  @override
  RetraitFormState createState() {
    return RetraitFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class RetraitFormState extends State<RetraitForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // debugPrint(fetchWallets() as String);

    log(fetchWallets() as String);
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectFormField(
                      enableSearch: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          filled: true, //<-- SEE HERE
    fillColor: Colors.deepPurpleAccent,
                        suffixIcon: const Icon(Icons.arrow_drop_down),
                        focusedBorder: const OutlineInputBorder(
                          //<-- SEE HERE
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                        )
                      ),
                      type: SelectFormFieldType.dropdown, // or can be dialog
                      items: _lieuDeProduction,
                      onChanged: (val) => print(val),
                      onSaved: (val) => print(val),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 100),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            Color.fromRGBO(4, 79, 120, 1))),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Echanger', style: TextStyle()), // <-- Text
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> _lieuDeProduction = [
  {
    'value': '',
    'label': 'Choisissez la Money a échanger',
    // 'enable': false,
    // 'icon': Icon(Icons.grade),
    // 'textStyle': TextStyle(color: Colors.red),
  },
  {
    'value': 'CGF BOURSE',
    'label': 'CGF BOURSE',
    'icon': const Icon(
      Icons.bar_chart_sharp,
      color: Colors.amber,
    ),
  },
  {
    'value': 'BitCoin',
    'label': 'BitCoin',
    'icon': const Icon(Icons.currency_bitcoin_outlined),
  },
  {
    'value': 'Binance',
    'label': 'Binance',
    'icon': const Icon(CryptoFontIcons.BAY),
  },
  {
    'value': 'Etherium',
    'label': 'Etherium',
    'icon': const Icon(CryptoFontIcons.ETH),
  },
  {
    'value': 'BRVM',
    'label': 'BRVM',
    'icon': const Icon(CryptoFontIcons.BRK),
  },
  {
    'value': 'DAX',
    'label': 'DAX',
    'icon': const Icon(CryptoFontIcons.DGX),
  },
  {
    'value': 'BEL20 INDEX',
    'label': 'BEL20 INDEX',
    'icon': const Icon(CryptoFontIcons.CLAM),
  },
  {
    'value': 'CAC 40',
    'label': 'CAC 40',
    'icon': const Icon(CryptoFontIcons.CLOAK),
  },
];
