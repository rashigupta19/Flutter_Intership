import 'package:flutter_riverpod/all.dart';
import 'package:second_task_riverpod/screens/Home1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      home: Home1(),
    ),
  ));
}
