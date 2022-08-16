import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskList extends StatelessWidget {
  String uid;
  TaskList(this.uid);
  var ref = FirebaseFirestore.instance.collection('taskdata');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.doc(uid).collection('task').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView.builder(
            itemBuilder: (context, index) {
              DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
              return TaskTile(
                isDone: documentSnapshot['isDone'],
                taskName: documentSnapshot['taskName'],
                onLongPress: () {
                  documentSnapshot['isDone']
                      ? documentSnapshot.reference.delete()
                      : null;
                },
                onChanged: (checkboxState) {
                  documentSnapshot.reference.update({'isDone': checkboxState});
                },
              );
            },
            itemCount: snapshot.hasData ? snapshot.data!.docs.length : 0,
          );
        });
  }
}
