import 'dart:async';

Future<String> getProfileUserName() async {
  await Future.delayed(Duration(seconds: 5));
  return "Riverpod Demo";
}
