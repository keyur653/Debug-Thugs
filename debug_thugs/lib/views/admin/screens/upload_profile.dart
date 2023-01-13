import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debug_thugs/controllers/process_data.dart';
import 'package:debug_thugs/views/student/screens/profile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
// import 'package:student_app/models.dart';

import '../../../Models/db_model.dart';

class UploadProfile extends StatefulWidget {
  @override
  _UploadProfile createState() => _UploadProfile();
}

class _UploadProfile extends State<UploadProfile> {
  String? id,
      name,
      rollNo,
      regNo,
      email,
      phoneNo,
      from,
      amount,
      batch,
      dept,
      dob;
  File? _image;
  String? cls;

  String? profileUrl;
  final picker = ImagePicker();
  final reference = FirebaseFirestore.instance;
  String? dep, yer;
  var _year = [
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '2010',
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023'
  ];
  String? _currentItemSelected2 = '2023';
  var _finance = [
    'Yes',
    'No',
  ];
  String? _currentItemSelected4 = 'Yes';
  var _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  String? _currentItemSelected = 'January';
  List<Contents> year = [];
  List<Contents> department = [];
  List<Contents> classes = [];
  TextEditingController dobController = TextEditingController();
  DatabaseReference obj = DatabaseReference();

  @override
  void initState() {
    super.initState();
    var yearRef = obj.getDetailRef('year');
    var depRef = obj.getDetailRef('department');
    yearRef.snapshots().listen((event) {
      if (mounted) {
        setState(() {
          for (var i = 0; i < event.docs.length; i++) {
            year.add(Contents.fromSnapshot(event.docs[i]));
          }
        });
      }
    });
    depRef.snapshots().listen((event) {
      if (mounted) {
        setState(() {
          for (var i = 0; i < event.docs.length; i++) {
            department.add(Contents.fromSnapshot(event.docs[i]));
          }
        });
      }
    });
  }

  Future update() async {
    FirebaseFirestore.instance
        .collection('collage')
        .doc('student')
        .collection(dept!)
        .doc(batch)
        .collection(cls!)
        .doc(regNo)
        .set({
      'Name': name.toString(),
      'Rollno': rollNo,
      'Regno': regNo,
      'Email': email,
      'PhoneNo': phoneNo,
      'Batch': batch,
      'yearNo': _currentItemSelected2,
      'Month': _currentItemSelected,
      'Department': dept,
      'DOB': dob,
      'Class': cls,
      'Financial assistance from': from,
      'Financial Amount': amount
    });
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget buildNameField() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        labelText: 'Name',
        hintText: 'Ex: Ramesh M',
        contentPadding: EdgeInsets.all(15.0),
        filled: true,
      ),
      maxLength: 20,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name required';
        }
        return null;
      },
      onSaved: (String? value) {
        name = value!;
      },
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildfinancefromField() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        labelText: 'Financial assistance from',
        hintText: 'Google',
        contentPadding: EdgeInsets.all(15.0),
        filled: true,
      ),
      maxLength: 20,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Financial assistance from is required';
        }
        return null;
      },
      onSaved: (String? value) {
        from = value!;
      },
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildfinanceamountField() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        labelText: 'Amount',
        hintText: '100000',
        contentPadding: EdgeInsets.all(15.0),
        filled: true,
      ),
      maxLength: 20,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Amount is required';
        }
        return null;
      },
      onSaved: (String? value) {
        amount = value!;
      },
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildRollNoField() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        labelText: 'Roll Number',
        hintText: 'Ex: B16cs058',
        contentPadding: EdgeInsets.all(15.0),
        filled: true,
      ),
      maxLength: 8,
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
    );
  }

  Widget buildRegNoField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        labelText: 'Register Number',
        hintText: 'Ex: 820617104035',
        contentPadding: EdgeInsets.all(15.0),
        filled: true,
      ),
      maxLength: 12,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Register Number Required';
        }
        return null;
      },
      onSaved: (String? value) {
        regNo = value!;
      },
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildEmailField() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        labelText: 'Email',
        hintText: 'Ex: example@gmail.com',
        contentPadding: EdgeInsets.all(15.0),
        filled: true,
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Email Required';
        }
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Valid Email Required';
        }
        return null;
      },
      onSaved: (String? value) {
        email = value!;
      },
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildPhoneField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        labelText: 'Phone Number',
        hintText: 'Ex: 9849342931',
        contentPadding: EdgeInsets.all(15.0),
        filled: true,
      ),
      maxLength: 10,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Phone Number Required';
        }
        return null;
      },
      onSaved: (String? value) {
        phoneNo = value!;
      },
    );
  }

  Widget buildBatchDropDown() {
    return DropdownButton(
      hint: const Text('select year'),
      onChanged: (String? name) {
        setState(() {
          batch = name!;
        });
      },
      value: batch,
      items: year
          .map((e) => DropdownMenuItem(
                value: e.name,
                child: Text(e.name!),
              ))
          .toList(),
    );
  }

  Widget buildyearDropDown() {
    return DropdownButton<String>(
      items: _year.map((String dropDownStringItem2) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem2,
          child: Text(
            dropDownStringItem2,
            style: TextStyle(fontSize: 16.5),
          ),
        );
      }).toList(),
      onChanged: (String? newValueSelected2) {
        setState(() {
          _currentItemSelected2 = newValueSelected2;
        });
      },
      value: _currentItemSelected2,
    );
  }

  Widget buildmonthDropDown() {
    return DropdownButton<String>(
      items: _months.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(
            dropDownStringItem,
            style: TextStyle(fontSize: 16.5),
          ),
        );
      }).toList(),
      onChanged: (String? newValueSelected) {
        setState(() {
          _currentItemSelected = newValueSelected;
        });
      },
      value: _currentItemSelected,
    );
  }

  Widget buildfinicialDropDown() {
    return DropdownButton<String>(
      items: _finance.map((String dropDownStringItem4) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem4,
          child: Text(
            dropDownStringItem4,
            style: TextStyle(fontSize: 16.5),
          ),
        );
      }).toList(),
      onChanged: (String? newValueSelected4) {
        setState(() {
          _currentItemSelected4 = newValueSelected4;
        });
      },
      value: _currentItemSelected4,
    );
  }

  Widget buildDeptDropDown() {
    return DropdownButton(
      hint: const Text('select department'),
      onChanged: (name) {
        setState(() {
          dept = name.toString();
        });
      },
      value: dept,
      items: department
          .map((e) => DropdownMenuItem(
                value: e.name,
                child: Text(e.name!),
              ))
          .toList(),
    );
  }

  Widget buildDOBField() {
    DateTime currentDateTime = DateTime.now(),
        initialDateTime = currentDateTime.add(Duration(days: -(10 * 365))),
        firstDateTime = currentDateTime.add(Duration(days: -(60 * 365))),
        lastDateTime = currentDateTime.add(Duration(days: -(5 * 365)));
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: dobController,
      readOnly: true,
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: initialDateTime,
          firstDate: firstDateTime,
          lastDate: lastDateTime,
        ).then((newDateTime) {
          if (newDateTime != null) {
            dobController.text = DateFormat('dd-MM-yyyy').format(newDateTime);
            dob = DateFormat('dd-MM-yyyy').format(newDateTime);
          }
        });
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        labelText: 'DOB',
        hintText: 'EX: 30-12-1999',
        contentPadding: EdgeInsets.all(15.0),
        filled: true,
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Date of Birth Required';
        }
        return null;
      },
    );
  }

  void initiateClass() {
    CollectionReference reference;
    reference = obj.getDetailRef2(batch, dept);
    reference.snapshots().listen((event) {
      classes.clear();
      setState(() {
        for (var i = 0; i < event.docs.length; i++) {
          classes.add(Contents.fromSnapshot(event.docs[i]));
        }
      });
    });
  }

  Widget retrieveClasses(batch, dept) {
    initiateClass();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'CLASS',
          style: TextStyle(),
        ),
        DropdownButton(
          hint: const Text('select class'),
          onChanged: (name) {
            setState(() {
              cls = name.toString();
            });
          },
          value: cls,
          items: classes
              .map((e) => DropdownMenuItem(
                    value: e.name,
                    child: Text(e.name!),
                  ))
              .toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildNameField(),
                  const SizedBox(height: 10),
                  buildRollNoField(),
                  const SizedBox(height: 10),
                  buildEmailField(),
                  const SizedBox(height: 20),
                  buildRegNoField(),
                  const SizedBox(height: 10),
                  buildPhoneField(),
                  const SizedBox(height: 10),
                  buildDOBField(),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Year',
                          style: TextStyle(),
                        ),
                        buildBatchDropDown()
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Year No',
                          style: TextStyle(),
                        ),
                        buildyearDropDown()
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Month',
                          style: TextStyle(),
                        ),
                        buildmonthDropDown()
                      ]),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'DEPARTMENT',
                        style: TextStyle(),
                      ),
                      Container(child: buildDeptDropDown()),
                    ],
                  ),
                  (dept != null && batch != null)
                      ? retrieveClasses(batch, dept)
                      : Container(),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Other finicial assistance',
                          style: TextStyle(),
                        ),
                        buildfinicialDropDown()
                      ]),
                  const SizedBox(height: 10),
                  (_currentItemSelected4 == 'Yes')
                      ? buildfinancefromField()
                      : Container(),
                  const SizedBox(height: 10),
                  (_currentItemSelected4 == 'Yes')
                      ? buildfinanceamountField()
                      : Container(),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {
                      formKey.currentState!.save();
                      update();
                      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => ProcessData(regNo, cls, dept, batch)));
                    },
                    child: const Text('Submit',
                        style: TextStyle(
                          fontSize: 16,
                        )), //onPressed
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
