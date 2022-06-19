import 'package:flutter/material.dart';
import 'package:third_task_api/utils/api_client.dart';

class ListOfUniversities extends StatefulWidget {
  const ListOfUniversities({Key? key}) : super(key: key);

  @override
  State<ListOfUniversities> createState() => _ListOfUniversitiesState();
}

class _ListOfUniversitiesState extends State<ListOfUniversities> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiClient apiClient = ApiClient.getInstance();

    apiClient.getUniversities();
    // since this method is an asyn function,
    //the data will be late and the build will be called early therefore it won't display anything
    //2 methods to resolve this is
    // 1)we get a Future here by returning future in the getsongs() method
    // 2) We hand our this class's function to getSongs() function in APi client -we create a call back function
    // 3) We wait here - apiClient.getSongs(); by using await key word
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Universities")),
      body: Container(
          // child:ListView.builder(itemBuilder: itemBuilder)
          ),
    );
  }
}
