import 'package:flutter/material.dart';
// import 'package:student_app/controllers.dart';

import '../../../controllers.dart';

class DialogBox extends StatefulWidget {


  @override
  _DialogBoxState createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: const Text('Details'),
      content: GetDetails(),
    );
  }
}
