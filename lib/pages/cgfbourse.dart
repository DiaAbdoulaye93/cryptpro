import 'package:cryptpro/widgets/charts.dart';
import 'package:flutter/material.dart';

class CgfBourse extends StatefulWidget {
  const CgfBourse({super.key});

   @override
  CgfBourseState createState() {
    return CgfBourseState();
  }
}
  class CgfBourseState extends State<CgfBourse> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
        child: Column(
          children: const [
            Charts(),
          ],
        ),
    );
  }


}
