import 'package:flutter/material.dart';

class ModalTopSet extends StatelessWidget {
  // ignore: non_constant_identifier_names
  Widget TopSetContent;
  // ignore: non_constant_identifier_names
  String BottomSetTitle;
  ModalTopSet({
    super.key,
    this.BottomSetTitle = "teste",
    required this.TopSetContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 6.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(0.0)),
      ),
      child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(0.0),
            ),
            color: Color.fromRGBO(52, 51, 58, 2),
          ),
          child: ListView(shrinkWrap: true, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    // Do something when the button is pressed
                    Navigator.pop(context);
                  },
                ),
                Text(
                  BottomSetTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Segoe UI'),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.dashboard,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Do something when the button is pressed
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            TopSetContent
          ])),
    );
  }
}
