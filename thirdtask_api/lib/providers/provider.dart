import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/models/university.dart';
import 'package:thirdtask_api/viewModel/api_client.dart';

final universityStateFuture = FutureProvider<List<University>>((ref) async {
  //final container = ProviderContainer();
  String dropdownvalue = await ref.watch(dropdownProvider);
  print("ffff $dropdownvalue");
  return await fetchUniversity(dropdownvalue);
});
//final dropdownProvider = StateProvider<String>((_ref) => "");

class MyString extends StateNotifier<String> {
  MyString() : super("India");

  void change(String text) => state = text;
}

final dropdownProvider =
    StateNotifierProvider<MyString, String>((_) => MyString());
