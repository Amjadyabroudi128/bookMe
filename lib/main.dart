import 'package:bookme/Screens/SplashScreen.dart';
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

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: SplashScreen(),
   );
  }
}



