import 'package:flutter/material.dart';

class CivilList extends StatefulWidget {
  @override
  State<CivilList> createState() => _CivilListState();
}

class _CivilListState extends State<CivilList> {
  bool select1 = false;
  bool select2 = false;
  bool select3 = false;
  bool select4 = false;
  String? rollNo;
  String? decesion;

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Civil")),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Name',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Reg. Id',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Year',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Semester',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
                rows: <DataRow>[
                  DataRow(
                    selected: select1,
                    onLongPress: () {
                      setState(() {
                        select1 = !select1;
                      });
                    },
                    cells: <DataCell>[
                      DataCell(Text('Akshay')),
                      DataCell(Text('211071014')),
                      DataCell(Text('2019')),
                      DataCell(Text('VI')),
                    ],
                  ),
                  DataRow(
                    selected: select2,
                    onLongPress: () {
                      setState(() {
                        select2 = !select2;
                      });
                    },
                    cells: <DataCell>[
                      DataCell(Text('Netra')),
                      DataCell(Text('211071013')),
                      DataCell(Text('2020')),
                      DataCell(Text('V')),
                    ],
                  ),
                  DataRow(
                    selected: select3,
                    onLongPress: () {
                      setState(() {
                        select3 = !select3;
                      });
                    },
                    cells: <DataCell>[
                      DataCell(Text('Nikhil')),
                      DataCell(Text('211071016')),
                      DataCell(Text('2021')),
                      DataCell(Text('IV')),
                    ],
                  ),
                  DataRow(
                    selected: select4,
                    onLongPress: () {
                      setState(() {
                        select4 = !select4;
                      });
                    },
                    cells: <DataCell>[
                      DataCell(Text('Keyur')),
                      DataCell(Text('211071064')),
                      DataCell(Text('2019')),
                      DataCell(Text('II')),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  onPressed: (() {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Text("Form Approved"),
                    ));
                    setState(() {
                      decesion = "Approve";
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
                      decesion = "Deny";
                    });
                  }),
                  child: Text(
                    "Deny",
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
          (decesion == "Deny") ? buildRollNoField() : Container(),
        ],
      ),
    );
  }
}
