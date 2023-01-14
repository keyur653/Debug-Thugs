import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/db_model.dart';

/// attendance page logic
class Attendance extends StatefulWidget {
  final String? year, dept, text = 'Attendance';

  const Attendance(this.year, this.dept);

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  String? cls;
  String? hasDate;
  List<Contents> classes = [];
  List<Item> item = [];
  DatabaseReference obj = DatabaseReference();
  String? decision;
  String? rollNo;

  Widget buildRollNoField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18, right: 10, left: 10),
          child: TextFormField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              labelText: 'Reason',
              hintText: 'Reason for denial',
              contentPadding: EdgeInsets.all(30.0),
              filled: true,
            ),
            maxLength: 25,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Roll Number Required';
              }
              return null;
            },
            onSaved: (String? value) {
              rollNo = value!;
            },
            textInputAction: TextInputAction.next,
          ),
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange)),
            onPressed: (() {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                content: Text("Uploaded Sucessfully"),
              ));
            }),
            child: Text(
              "submit",
              style: TextStyle(color: Colors.black),
            )),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    CollectionReference reference;
    if (widget.text == 'Delete students' ||
        widget.text == 'Attendance' ||
        widget.text == 'Delete class') {
      reference = obj.getDetailRef2(widget.year, widget.dept);
      reference.snapshots().listen((event) {
        setState(() {
          for (var i = 0; i < event.docs.length; i++) {
            classes.add(Contents.fromSnapshot(event.docs[i]));
          }
        });
      });
    } else if (widget.text == 'Delete department') {
      setState(() {
        reference = obj.getDetailRef('department');
        reference.snapshots().listen((event) {
          setState(() {
            for (var i = 0; i < event.docs.length; i++) {
              classes.add(Contents.fromSnapshot(event.docs[i]));
            }
          });
        });
      });
    } else if (widget.text == 'Delete year') {
      setState(() {
        reference = obj.getDetailRef('year');
        reference.snapshots().listen((event) {
          setState(() {
            for (var i = 0; i < event.docs.length; i++) {
              classes.add(Contents.fromSnapshot(event.docs[i]));
            }
          });
        });
      });
    }
  }

  void _clearItem() {
    setState(() {
      item.clear();
    });
  }

  void _clearClasses() {
    setState(() {
      classes.clear();
    });
  }

  void _getStudent() {
    _clearItem();
    var ref = obj.getProfile(cls, widget.year, widget.dept);
    print(ref);
    ref.snapshots().listen((event) {
      setState(() {
        for (var i = 0; i < event.docs.length; i++) {
          item.add(Item.fromSnapshot(event.docs[i]));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Selections'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            (widget.text == 'Delete students' || widget.text == 'Attendance')
                ? DropdownButton(
                    hint: const Text('select Class'),
                    onChanged: (dynamic name) {
                      setState(() {
                        cls = name;
                        _getStudent();
                      });
                    },
                    value: cls,
                    items: classes
                        .map((e) => DropdownMenuItem(
                              value: e.name,
                              child: Text(e.name!),
                            ))
                        .toList(),
                  )
                : Container(),
            (widget.text == 'Delete students' || widget.text == 'Attendance')
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10),
                    itemCount: item.length,
                    itemBuilder: (context, int index) => Container(
                        color: item[index].isSelected
                            ? Colors.lightBlueAccent
                            : Colors.white,
                        child: ListTile(
                          title: Text(
                            item[index].name!,
                            style: TextStyle(color: Colors.black),
                          ),
                          subtitle: Text(item[index].regNo,
                              style: TextStyle(color: Colors.black)),
                          onTap: () {
                            setState(() {
                              item[index].isSelected = false;
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              item[index].isSelected = true;
                            });
                          },
                        )))
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10),
                    itemCount: classes.length,
                    itemBuilder: (context, int index) => Container(
                        color: classes[index].isSelected
                            ? Colors.lightBlueAccent
                            : Colors.white,
                        child: ListTile(
                          title: Text(classes[index].name!),
                          onTap: () {
                            setState(() {
                              classes[index].isSelected = false;
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              classes[index].isSelected = true;
                            });
                          },
                        ))),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    onPressed: (() {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Form Approved"),
                      ));
                      setState(() {
                        decision = "Approve";
                      });
                    }),
                    child: Text(
                      "Approve",
                      style: TextStyle(color: Colors.black),
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: (() {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Form Denied"),
                      ));
                      setState(() {
                        decision = "Deny";
                      });
                    }),
                    child: Text(
                      "Deny",
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
            (decision == "Deny") ? buildRollNoField() : Container(),
          ],
        ),
      ),
    );
  }
}
