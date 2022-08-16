import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_doist/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddTaskScreen extends StatelessWidget {
  String uid;
  AddTaskScreen(this.uid);
  String newTaskTitle = '';
  CollectionReference ref = FirebaseFirestore.instance.collection('taskdata');

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF12141C),
      child: Container(
        width: double.infinity,
        height: 475,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white12,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    color: Colors.lightBlueAccent, fontSize: 30),
              ),
              TextField(
                autofocus: true,
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 25,
              ),
              TextButton(
                onPressed: () {
                  ref.doc(uid).collection('task').add({
                    'taskName': newTaskTitle,
                    'isDone': false,
                  });
                  // ref.add({
                  //   'taskName': newTaskTitle,
                  //   'isDone': false,
                  // });
                  Navigator.pop(context);
                },
                child: Text(
                  'Add',
                  style: kTextStyle,
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF185ABD),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
