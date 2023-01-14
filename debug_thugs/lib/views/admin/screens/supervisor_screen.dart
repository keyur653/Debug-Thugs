import 'package:debug_thugs/views/admin/admin_widgets.dart';
import 'package:flutter/material.dart';

class Supervisor extends StatefulWidget {
  @override
  _SupervisorState createState() => _SupervisorState();
}

class _SupervisorState extends State<Supervisor> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    profileCardView('Name :  Nik'),
                    profileCardView('Email :  abc@gmail.com'),
                    profileCardView('Department :  IT'),
                    profileCardView('Role :  Supervisor'),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DialogBox()),
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
        padding: const EdgeInsets.all(23.0),
        child: Text(
          detailsText,
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
