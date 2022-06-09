import 'package:flutter/material.dart';
import 'package:second_task_riverpod/models/Contacts.dart';
import 'package:second_task_riverpod/widgets/contact_list.dart';
import 'package:second_task_riverpod/widgets/text_form_field.dart';

class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  TextEditingController tc1 = TextEditingController();
  TextEditingController tc2 = TextEditingController();
  List<Contacts> contacts = [Contacts("Rashi", "phone")];

  _addnames() {
    contacts.insert(0, Contacts(tc1.text, tc2.text));
    setState(() {});
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
                TextBox(label: "name", tc: tc1),
                SizedBox(height: 10),
                TextBox(label: "Phone Number ", tc: tc2),
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
            ContactList(contacts),
            Text('The value is ${contacts[0].name} ')
          ],
        ),
      ),
    );
  }
}
