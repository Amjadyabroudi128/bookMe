import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp( BookMeForm());
}

class BookMeForm extends StatefulWidget {

  @override
  State<BookMeForm> createState() => _BookMeFormState();
}

class _BookMeFormState extends State<BookMeForm> {

  String username ="";
  String email ="";
  String when = "";
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Scaffold(
       appBar: AppBar(
         title: Text("Amazing hairCuts"),
         backgroundColor: Colors.black,
       ),
       body: Container(
           child: SingleChildScrollView(
             child: Column(
               children: [
                 Image.asset("images/376.jpg", fit: BoxFit.cover, height: 350, width: 450,),
                 SizedBox(height: 18,),
                 AnimatedTextKit(
                   animatedTexts: [
                     TyperAnimatedText(
                       "Welcome to our Barbershop, we have great haircuts, amazing beard trims ",
                       textStyle: TextStyle(
                         fontSize: 20
                       )
                     )
                   ],
                 ),
                 const Text("name"),
                 TextField(
                   onChanged: (value) {
                     username = value;
                   },
                 ),
               ],
             ),
           ),

       )
     ),
   );
  }
}

