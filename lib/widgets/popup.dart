import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DialogExample extends StatelessWidget {
  String title;
  String priceLabel;
  String price;
  Color shadowColor;
  DialogExample(
      {super.key,
      required this.title,
      required this.priceLabel,
      required this.price,
      this.shadowColor = Colors.black});

  @override
  Widget build(BuildContext context) => AlertDialog(
        elevation: 50,
        shadowColor: shadowColor,
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        content: Container(
          height: 100,
          padding: EdgeInsets.all(0),
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(priceLabel),
                  Text(
                    price,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Date"),
                  Text(DateFormat("dd-MM-yyyy").format(DateTime.now()))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Heure "),
                  Text(DateFormat("HH:mm").format(DateTime.now()))
                ],
              )
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Annuler',style: TextStyle(color: Colors.red),),
          ),
          TextButton(
            onPressed: () =>
            AlertDialog(
                        title: Text('Flash'),
                        content: Text(
                            '⚡️A highly customizable, powerful and easy-to-use alerting library for Flutter.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('YES'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('NO'),
                          ),
                        ],
                      ),
            child: const Text('Confirmer',style: TextStyle(color: Colors.green)),
          ),
        ],
      );
}

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('data'),
    );
  }
}
