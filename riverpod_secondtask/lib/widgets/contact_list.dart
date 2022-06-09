import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_secondtask/controller/providers.dart';

import '../models/Contacts.dart';

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          height: 400,
          child: Consumer(builder: ((context, watch, child) {
            final contactList = watch(contactListProvider);

            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: contactList.length,
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
                          '${contactList[index].name} ',
                          style: GoogleFonts.pacifico(fontSize: 18),
                        ),
                        Text(
                          ' ${contactList[index].phone} ',
                          style: TextStyle(fontSize: 18),
                        ),
                      ])
                    ]),
                  );
                });
          }))),
    );
  }
}
