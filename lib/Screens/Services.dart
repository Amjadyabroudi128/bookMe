import 'package:bookme/Screens/allBooked.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Services extends StatefulWidget {
final String value;
final int price;

 const Services({
   Key? key,
 required this.value, required this.price,
 }) : super (key: key);


  @override
  State<Services> createState() => _HairCutsState();
}

class _HairCutsState extends State<Services> {
  DateTime today = DateTime.now().toLocal();
  void _onDaySelected( DateTime day, DateTime focusDay) {
    setState(() {
      today = focusDay;
    });
  }

  String name = "";
  String comment ="";
  TextEditingController emailController = TextEditingController();
  final dataBase = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("book an Appointment", style: TextStyle(color: Colors.black),),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 35,),
              Container(
                child: TableCalendar(
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                        color: Colors.teal,
                        shape: BoxShape.circle
                    ),
                  ),
                  rowHeight: 35,
                  headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  focusedDay: today,
                  firstDay: DateTime.now(),
                  lastDay: DateTime.utc(2030, 3, 10),
                  onDaySelected: _onDaySelected,

                ),
              ),
              Divider(thickness: 0.5, color: Colors.grey,),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: <Widget>[
                     Flexible(
                      child: TextField(
                        decoration:  InputDecoration(
                            labelText: "Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                        ),
                        onChanged: (value ){
                          name = value;
                        },
                      ),
                    ),
                    SizedBox(width: 20,),
                    Flexible(
                      child:  TextField(
                        decoration:  InputDecoration(
                            labelText: "email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                          ),
                        ),
                        onChanged: (value ){
                          emailController.text = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 20,),
                    Flexible(
                      child:  TextField(
                        decoration:  InputDecoration(
                          labelText: "add comment",
                          prefixIcon: Icon(Icons.comment, color: Colors.grey,),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                        ),
                        onChanged: (value ){
                          comment = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25,),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text("${widget.value}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Spacer(),
                        Text("£${widget.price}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child:Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(30),
                          color: Colors.teal,

                        ),
                        child: MaterialButton(
                          child: Text("book", style: TextStyle(fontWeight: FontWeight.bold),),
                          onPressed: () async {
                            await dataBase.collection("Services").doc().set(
                              {
                                "service": widget.value,
                                "price": ("£${widget.price}"),
                                "date": FieldValue.serverTimestamp(),
                                "name": name,
                                "comment": comment,
                              }
                            );
                            print('things submitted');
                            Navigator.push(
                              context,
                              CupertinoPageRoute(builder: (context) => const allBooked()),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
