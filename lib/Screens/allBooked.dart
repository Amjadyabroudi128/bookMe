import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class allBooked extends StatelessWidget {
  const allBooked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              color: Colors.green,
              Icons.check_circle_outline, size: 40,
            ),
            SizedBox(height: 30,),
            Center(
              child: Text("You are all booked, see you soon!",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.cyan),),
            )
          ],
        ) ,
      ),
    );
  }
}
