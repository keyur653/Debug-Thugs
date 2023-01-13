import 'package:debug_thugs/views/admin/admin_screens.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final List<String> details;

  const Profile({required this.details});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    profileCardView('Name :  ${widget.details[0]}'),
                    SizedBox(
                      height: 5,
                    ),
                    profileCardView(
                        'Roll no : ${widget.details[1].toString().toUpperCase()}'),
                    SizedBox(
                      height: 5,
                    ),
                    profileCardView('Register no : ${widget.details[2]}'),
                    SizedBox(
                      height: 5,
                    ),
                    profileCardView('Phone number : ${widget.details[3]}'),
                    SizedBox(
                      height: 5,
                    ),
                    profileCardView('DOB :  ${widget.details[4]}'),
                    SizedBox(
                      height: 5,
                    ),
                    profileCardView('Batch :  ${widget.details[5]}'),
                    SizedBox(
                      height: 5,
                    ),
                    profileCardView('Email :  ${widget.details[6]}'),
                    SizedBox(
                      height: 5,
                    ),
                    profileCardView('Department :  ${widget.details[7]}'),
                    SizedBox(
                      height: 5,
                    ),
                    profileCardView('Class :  ${widget.details[8]}'),
                    SizedBox(
                      height: 5,
                    ),
                    profileCardView('Month :  ${widget.details[9]}'),
                    SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => UploadProfile()),
                          );
                        },
                        child: const Text('Apply for next month',
                            style: TextStyle(
                              fontSize: 16,
                            ))),
                    // OutlinedButton(
                    // onPressed: () {
                    //   Navigator.pop(context);
                    // },
                    // child: const Text('Apply for next month',
                    //     style: TextStyle(
                    //       fontSize: 16,
                    //     )),)
                    // profileCardView('Month :  ${widget.details[9]}'),
                    // SizedBox(
                    //   height: 5,
                    // ),
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
