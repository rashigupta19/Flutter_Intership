import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thirdtask_api/screens/list_of_universities.dart';

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      home: ListOfUniversities(),
    ),
  ));
}
