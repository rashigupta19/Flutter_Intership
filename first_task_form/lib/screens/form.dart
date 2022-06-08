import 'dart:ffi';

import 'package:first_task_form/models/Contacts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Form_Task extends StatefulWidget {
  const Form_Task({Key? key}) : super(key: key);

  @override
  State<Form_Task> createState() => _Form_TaskState();
}

class _Form_TaskState extends State<Form_Task> {
  TextEditingController tc1 = TextEditingController();
  TextEditingController tc2 = TextEditingController();

  List<Contacts> contacts = [];
  // String name = "";
  // String phone = "";
  // List<String> List_names = <String>[];
  // List<String> List_Phone_numbers = <String>[];

  _addnames() {
    // name = tc1.text;
    // phone = tc2.text;
    // List_names.insert(0, name);
    // List_Phone_numbers.insert(0, phone);
    contacts.insert(0, Contacts(tc1.text, tc2.text));
    setState(() {});
  }

  _textformfield(String field_name, TextEditingController tc) {
    return TextFormField(
        controller: tc,
        style: TextStyle(
          fontSize: 24,
          color: Colors.blue,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          focusColor: Colors.white,

          prefixIcon: Icon(
            Icons.person_outline_rounded,
            color: Colors.grey,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.grey,

          hintText: "$field_name",

          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontFamily: "verdana_regular",
            fontWeight: FontWeight.w400,
          ),

          labelText: '$field_name ',
          //lable style
          labelStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontFamily: "verdana_regular",
            fontWeight: FontWeight.w400,
          ),
        ));
  }

  _listView() {
    return SingleChildScrollView(
      child: Container(
          height: 400,
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: contacts.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 70,
                  margin: EdgeInsets.all(2),
                  color: Color.fromARGB(255, 193, 216, 234),
                  child: Row(children: [
                    SizedBox(width: 10),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(children: [
                      Text(
                        '${contacts[index].name} ',
                        style: GoogleFonts.pacifico(fontSize: 18),
                      ),
                      Text(
                        ' ${contacts[index].phone} ',
                        style: TextStyle(fontSize: 18),
                      ),
                    ])
                  ]),
                );
              })),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact List"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),

            Form(
              child: Column(children: [
                _textformfield("Name", tc1),
                SizedBox(height: 10),
                _textformfield("Phone number", tc2),
                ElevatedButton(
                  onPressed: () {
                    _addnames();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 8, 84, 217)),
                  child: const Text(
                    'SUBMIT',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                )
              ]),
            ),

            _listView()
            // Text('The value is $val')
          ],
        ),
      ),
    );
  }
}
