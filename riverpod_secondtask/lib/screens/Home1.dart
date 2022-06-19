import 'package:flutter/material.dart';
import 'package:riverpod_secondtask/providers/contact_list_provider.dart';
import 'package:riverpod_secondtask/providers/providers.dart';
import 'package:riverpod_secondtask/models/Contacts.dart';
import 'package:riverpod_secondtask/widgets/contact_list.dart';
import 'package:riverpod_secondtask/widgets/text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  TextEditingController tc1 = TextEditingController();
  TextEditingController tc2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Consumer(builder: (context, watch, child) {
        AsyncValue<String> name = watch(profileNameProvider);

        return name.when(
            data: (name) => Text(name),
            loading: () => Text("Loading.. "),
            error: (e, stackTrace) => Text("Error..."));
      })),

      
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              context.read(channelNameProvider),
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            Form(
              child: Column(children: [
                TextBox(label: "name", tc: tc1),
                SizedBox(height: 10),
                TextBox(label: "Phone Number ", tc: tc2),
                Consumer(builder: ((context, watch, child) {
                  final ContactListController controller =
                      context.read(contactListProvider.notifier);

                  return ElevatedButton(
                    onPressed: () {
                      controller.addContact(Contacts(tc1.text, tc2.text));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 8, 84, 217)),
                    child: const Text(
                      'SUBMIT',
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  );
                })),
              ]),
            ),
            ContactList(),
            //  Text('The value is ${contacts[0].name} ')
          ],
        ),
      ),
    );
  }
}
