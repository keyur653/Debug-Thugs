import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debug_thugs/views/student/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:student_app/views/student/student_widgets.dart';

import '../views/student/widgets/student_bottomnavbar.dart';

/// this is the initial state which fetches info related to starting the app
class ProcessData extends StatefulWidget {
  final String? _regno, _class, _dept,_batch;

  const ProcessData(this._regno, this._class, this._dept, this._batch);

  @override
  _ProcessDataState createState() => _ProcessDataState();
}

class _ProcessDataState extends State<ProcessData> {
  final reference = FirebaseFirestore.instance;
  String? _batch, _dept;
  List<String> details = [];
  final Future<SharedPreferences> _preference = SharedPreferences.getInstance();

  Future<List> stream() async {

    reference
        .collection('collage')
        .doc('student')
        .collection(widget._dept!)
        .doc(widget._batch)
        .collection(widget._class!)
        .doc(widget._regno)
        .snapshots()
        .listen((event) async {
      details
        ..add(event.data()!['Name'])
        ..add(event.data()!['Rollno'])
        ..add(event.data()!['Regno'])
        ..add(event.data()!['PhoneNo'])
        ..add(event.data()!['DOB'])
        ..add(event.data()!['Batch'])
        ..add(event.data()!['Email'])
        ..add(event.data()!['Department'])
        ..add(event.data()!['Class'])
        ..add(event.data()!['Month']);

      reference
          .collection('collage')
          .doc('date')
          .collection('working')
          .snapshots()
          .listen((event) {
        var days = 0;
        for (var i = 0; i < event.docs.length; i++) {
          days = days + 1;
          // setState(() {
          //   workingdays.add(Contents.fromSnapshot(event.documents[i]));
          // });
          // print('$days' + '********');
        }
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => Profile(details: details)),
        );
      });
    });
    return details;
  }

  void getTotalDays() {}

  @override
  void initState() {
    super.initState();
    getTotalDays();
    stream();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
