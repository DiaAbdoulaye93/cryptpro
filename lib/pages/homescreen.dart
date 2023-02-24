import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

   @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}
class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
      Container(
        padding: EdgeInsets.all(0),
      ),
      Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
           const Text("Build your future",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
           Container(
            padding: EdgeInsets.all(20),
          child: const Text("Start investing today and your future will change for better",style:TextStyle(color: Color.fromARGB(255, 197, 190, 190),letterSpacing: 2.0,wordSpacing: 3), textAlign: TextAlign.center,)
           )
          ],
        ),
      ),
      Row(
        
      ),
      Center(child: SliderButton(
      action: () {
        ///Do something here
        Navigator.of(context).pop();
      },
       label: const Text(
          "Let's start        › › ›",
          style: TextStyle(
               fontWeight: FontWeight.w500, fontSize: 17),
        ),
      icon:const Icon(Icons.navigate_next),
      backgroundColor: Color.fromARGB(63,62,69, 69),


    ))

     ],
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}