import 'package:debug_thugs/views/admin/admin_widgets.dart';
import 'package:debug_thugs/views/admin/screens/draw.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeacherScreen extends StatefulWidget {
  @override
  _TeacherScreenState createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(CupertinoIcons.profile_circled),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // CircleAvatar(
                //   foregroundImage: NetworkImage("assets/grade.png"),
                //   radius: 110,
                //   backgroundColor: Colors.transparent,
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    profileCardView('Name :  Sidhanr baheti'),
                    profileCardView('Email :  abc@gmail.com'),
                    profileCardView('Department :  civil'),
                    profileCardView('Class :  Environmental'),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Draw()),
                          );
                        },
                        child: Text("See Student List"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card profileCardView(String detailsText) {
    return Card(
      elevation: .8,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Text(
          detailsText,
          style: const TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
