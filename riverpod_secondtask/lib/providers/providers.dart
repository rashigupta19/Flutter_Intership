import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_secondtask/api/my_api.dart';
import 'package:riverpod_secondtask/providers/contact_list_provider.dart';

final channelNameProvider = Provider<String>((_) => "Contact List");

final profileNameProvider = FutureProvider<String>((_) => getProfileUserName());

final contactListProvider =
    StateNotifierProvider((_) => ContactListController());
