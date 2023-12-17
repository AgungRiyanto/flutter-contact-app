import 'package:flutter_contact_app/services/api.dart';
import 'package:flutter_contact_app/models/contact.dart';
import 'package:flutter/material.dart';

class ContactProvider extends ChangeNotifier {
  HttpService httpService = HttpService();
  bool isLoading = false;
  List<Contact> contacts = [];

  getContactList(context, String searchQuery, String gender) async {
    isLoading = true;
    contacts =
        await httpService.getContactList(name: searchQuery, gender: gender);
    isLoading = false;

    notifyListeners();
  }
}
