import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_secondtask/models/Contacts.dart';

class ContactListController extends StateNotifier<List<Contacts>> {
  ContactListController() : super([]);

  addContact(Contacts contacts) {
    state = [contacts, ...state];
    //...state - existing state + new added contacts
  }
}
