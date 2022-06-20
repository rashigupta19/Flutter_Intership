import 'package:flutter/material.dart';
import 'package:thirdtask_api/widgets/DropDown.dart';
import 'package:thirdtask_api/widgets/ListView.dart';

class ListOfUniversities extends StatelessWidget {
  const ListOfUniversities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 234, 234, 232),
        appBar: AppBar(
          title: Text(
            "Universities",
            style: TextStyle(color: Color.fromARGB(255, 67, 66, 66)),
          ),
          backgroundColor: Colors.amber,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.amber,
              ),
              child: DropdownButtonHideUnderline(
                  child: DropDownButton() //  Dropdown Widget
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            ListViewWidget() //ListView Widget
          ],
        ));
  }
}
