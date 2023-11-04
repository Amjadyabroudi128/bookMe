import 'dart:developer';

import 'package:bookme/Screens/Services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String value = "";
  String price = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                  padding: EdgeInsets.all(5),
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
                Text("cuts amd Trims ", style: TextStyle(color: Colors.grey, fontSize: 19,),),
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
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(builder: (context) =>  Services(value: 'Haircut', price: 16,)),
                                  );
                                },
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
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(builder: (context) =>  Services(value: 'Beard Trim', price: 8,)),
                                  );
                                },
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
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(builder: (context) =>  Services(value: 'Hot Towel', price: 3,)),
                                  );
                                },
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
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(builder: (context) =>  Services(value: 'Nose and ear wax', price: 5,)),
                                  );
                                },
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

        ),
    );
  }
}
