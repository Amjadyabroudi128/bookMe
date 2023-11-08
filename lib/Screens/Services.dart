
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
  final formKey = GlobalKey<FormState>(); //key for form

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
          child: Form(
            key: formKey,
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
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: time);
                      if(newTime == null) return;
                      setState(() => time = newTime);
                    },
                    child: Container(
                      color: Colors.grey,
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Text("${time.hour}: ${time.minute}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                          Spacer(),
                          Icon(Icons.access_time_outlined, size: 40,)
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: <Widget>[
                       Flexible(
                          child: TextFormField(
                            controller: nameController,
                            decoration:  InputDecoration(
                                labelText: "Name",
                              hintText: "Enter a name",
                              prefixIcon: Icon(
                                Icons.person
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)
                              ),
                            ),
                            validator: (value){
                              if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                                //allow upper and lower case alphabets and space
                                return "Enter a Name";
                              }else{
                                return null;
                              }
                            },
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                          ),
                      ),
                      SizedBox(width: 20,),
                      Flexible(
                        child:  TextFormField(
                          controller: emailController,
                          decoration:  InputDecoration(
                            prefixIcon: Icon(
                              Icons.email
                            ),
                              labelText: "email",
                              hintText: "e.g John@Gmail.com",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                            ),
                          ),
                          validator: (value){
                            if(value!.isEmpty || !RegExp(r'\S+@\S+\.\S+').hasMatch(value)){
                              //allow upper and lower case alphabets and space
                              return "type an email";
                            }else{
                              return null;
                            }
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Comment (optional)" , style: TextStyle(color: Colors.grey.shade700),),
                      SizedBox(height: 10,),
                      TextField(
                        controller: commentController,
                        decoration:  InputDecoration(
                          prefixIcon: Icon(Icons.comment, color: Colors.grey,),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                        ),
                        onChanged: (value ){
                          commentController.text = value;
                        },

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
                              await _showMyDialog();
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
      ),
    );
  }
  void clearText(){
    nameController.clear();
    emailController.clear();
    commentController.clear();
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content:  SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(child: Text("You are about to book ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),)),
                    SizedBox(height: 20,),
                    Text("${widget.value}"),
                    SizedBox(height: 5,),
                    Text("At ${time.hour}: ${time.minute}"),
                    SizedBox(height: 5,),
                    Text("On ${today.day}: ${today.month} : ${today.year}")
                  ],
                ),
                Text('are you sure? ',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20.0,
                  ),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('yes',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()){
                   dataBase.collection("Services").doc().set(
                      {
                        "service": widget.value,
                        "price": ("£${widget.price}"),
                        "date": today,
                        "name": nameController.text,
                        "comment": commentController.text,
                        "time": ("${time.hour}: ${time.minute}"),
                      }
                  );
                  print('things submitted');
                  clearText();

                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => const allBooked()),
                  );
                   ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                     content: Text('You have successfully booked a ${widget.value}'),

                   ));
                }
                else {
                 ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                    content: Text('please fill the required fields'),
                  ));
                }
              }

            ),
            TextButton(
              child: const Text('cancel',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: ()  {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}


