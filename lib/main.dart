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
       body: SafeArea(
           child: SingleChildScrollView(
             child: Column(
               children: [
                 Image.asset("images/376.jpg", fit: BoxFit.cover, height: 280,width: MediaQuery.of(context).size.width,
                     ),
                 SizedBox(height: 18,),
                 Container(
                   alignment: Alignment.topLeft,
                   child: Text.rich(
                     TextSpan(
                       text: "hey everyone, we have amazing ",
                       style: TextStyle( fontSize: 18, ),
                       children: [
                         TextSpan(
                             text: "Haircuts " , style: TextStyle(
                           fontWeight: FontWeight.bold,
                         )
                         ),
                         TextSpan(
                             text:  "and so many other great services!, do not Hesitate to book with us ",
                             style: TextStyle(
                               height: 3.0,
                             )
                         ),
                       ],
                     ),
                   ),
                 ),
                 SizedBox(height: 12,),
                 Text("cuts amd Trims ", style: TextStyle(color: Colors.grey, fontSize: 19),),
                 Card(
                   child: Column(
                     children: [
                       Row(
                         children: [
                           Text("Haircuts"),
                           Spacer(),
                           Text("£16"),
                           SizedBox(width: 12,),
                       Padding(
                         padding: EdgeInsets.all(12.0),
                          child:Container(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadiusDirectional.circular(30),
                               color: Colors.blueAccent,

                             ),
                             child: MaterialButton(
                               child: Text("book", style: TextStyle(fontWeight: FontWeight.bold),),
                               onPressed: (){},
                             ),
                           ),
                          ),
                         ],
                       ),
                       Row(
                         children: [
                           Text("Beard Trim"),
                           Spacer(),
                           Text("£8"),
                           SizedBox(width: 12,),
                           Padding(
                             padding: EdgeInsets.all(12.0),
                             child:Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadiusDirectional.circular(30),
                                 color: Colors.indigoAccent,

                               ),
                               child: MaterialButton(
                                 child: Text("book", style: TextStyle(fontWeight: FontWeight.bold),),
                                 onPressed: (){},
                               ),
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
                 Text("more services", style: TextStyle(color: Colors.grey, fontSize: 20),),
                 Card(
                   child: Column(
                     children: [
                       Row(
                         children: [
                           Text("Hot Towel"),
                           Spacer(),
                           Text("£3"),
                           SizedBox(width: 12,),
                           Padding(
                             padding: EdgeInsets.all(12.0),
                             child:Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadiusDirectional.circular(30),
                                 color: Colors.teal,

                               ),
                               child: MaterialButton(
                                 child: Text("book", style: TextStyle(fontWeight: FontWeight.bold),),
                                 onPressed: (){},
                               ),
                             ),
                           ),
                         ],
                       ),
                       Row(
                         children: [
                           Text("Nose and ear wax"),
                           Spacer(),
                           Text("£5"),
                           SizedBox(width: 12,),
                           Padding(
                             padding: EdgeInsets.all(12.0),
                             child:Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadiusDirectional.circular(30),
                                 color: Colors.grey,

                               ),
                               child: MaterialButton(
                                 child: Text("book", style: TextStyle(fontWeight: FontWeight.bold),),
                                 onPressed: (){},
                               ),
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           ),

       )
     ),
   );
  }
}

