import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_doist/screens/add_task_screen.dart';
import 'package:to_doist/screens/welcome_screen.dart';
import 'package:to_doist/widgets/task_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TodoistScreen extends StatefulWidget {
  static const String id = 'todoist_screen';
  @override
  _TodoistScreenState createState() => _TodoistScreenState();
}

class _TodoistScreenState extends State<TodoistScreen> {
  String uid = '';
  final _auth = FirebaseAuth.instance;
  // int taskLength = 0;
  CollectionReference ref = FirebaseFirestore.instance.collection('taskdata');

  void initState() {
    super.initState();
    getCurrentUser();
    // gettaskLength();
  }

  // Future<int> gettaskLength() async {
  //   setState(() async {
  //     taskLength = await ref.doc(uid).collection('task').snapshots().length;
  //   });
  //   return taskLength;
  // }
  //
  // int count = await gettaskLength();

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        uid = user.uid;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          'images/microsoft_todo_2019_96px.png',
                          height: 45,
                          width: 45,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _auth.signOut();
                          Navigator.pushNamed(context, WelcomeScreen.id);
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size(30, 30),
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                        child: Text(
                          'Logout',
                          style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'To-do-List',
                    style: GoogleFonts.openSans(
                      fontSize: 45,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Add Tasks by pressing "+" button',
                    style: GoogleFonts.openSans(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Delete by long pressing finished task(checkbox tick)',
                    style: GoogleFonts.openSans(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: TaskList(uid),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white12,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(uid),
            isScrollControlled: true,
          );
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
