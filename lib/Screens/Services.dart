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
  DateTime today = DateTime.now();
  void _onDaySelected( DateTime day, DateTime focusDay) {
    setState(() {
      today = focusDay;
    });
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  final dataBase = FirebaseFirestore.instance;
  TimeOfDay time = TimeOfDay(hour: 12, minute: 12);
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
                  lastDay: DateTime.utc(2030, 3, 10, 4, 3, 12).toLocal(),
                  onDaySelected: _onDaySelected,
                ),
              ),
              Divider(thickness: 0.5, color: Colors.grey,),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text("${time.hour}:${time.minute}", style: TextStyle(fontSize: 30),),
                  Spacer(),
                  IconButton(
                      onPressed: ()async{
                        TimeOfDay? newTime = await
                        showTimePicker(context: context,
                            initialTime: time);
                        if(newTime == null) return;
                        setState (()=> time = newTime);
                      },
                      icon: Icon(Icons.access_time_outlined, size: 40,)),

                ],
              ),


              Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: <Widget>[
                     Flexible(
                      child: TextField(
                        controller: nameController,
                        decoration:  InputDecoration(
                            labelText: "Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                        ),
                        onChanged: (value ){
                          nameController.text = value;
                        },
                      ),
                    ),
                    SizedBox(width: 20,),
                    Flexible(
                      child:  TextField(
                        controller: emailController,
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
                        controller: commentController,
                        decoration:  InputDecoration(
                          labelText: "add comment",
                          prefixIcon: Icon(Icons.comment, color: Colors.grey,),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                        ),
                        onChanged: (value ){
                          commentController.text = value;
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
                                "date": DateTime.utc(2030, 1, 3,).toLocal(),
                                "name": nameController.text,
                                "comment": commentController.text,
                                "time": ("${time.hour}: ${time.minute}"),
                              }
                            );
                            print('things submitted');
                            clearText();

                            // Navigator.push(
                            //   context,
                            //   CupertinoPageRoute(builder: (context) => const allBooked()),
                            // );
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
  void clearText(){
    nameController.clear();
    emailController.clear();
    commentController.clear();
  }
}
