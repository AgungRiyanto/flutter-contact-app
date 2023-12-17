import 'package:flutter/material.dart';
import 'package:flutter_contact_app/providers/contact_provider.dart';
import 'package:flutter_contact_app/screens/detail.dart';
import 'package:flutter_contact_app/widgets/contact_list_item.dart';
import 'package:flutter_contact_app/widgets/header.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String searchQuery = '';
  String genderSelected = '';
  @override
  void initState() {
    super.initState();
    final contactProvider =
        Provider.of<ContactProvider>(context, listen: false);
    contactProvider.getContactList(context, searchQuery, genderSelected);
  }

  Widget buildList(data) {
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => ContactListItem(
          item: data[index],
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(seconds: 1),
                pageBuilder: (_, __, ___) => Detail(
                  detail: data[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void handleGetList(q, gender) {
    final provider = Provider.of<ContactProvider>(context, listen: false);
    provider.getContactList(context, q, gender);
  }

  void onTapFilter() {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Filter by gender'),
          content: Column(
            children: [
              ListTile(
                title: const Text('Male'),
                leading: Radio(
                  value: 'male',
                  groupValue: genderSelected,
                  onChanged: (value) {
                    setState(() {
                      genderSelected = value!;
                    });
                    handleGetList(searchQuery, value);
                    Navigator.pop(context);
                  },
                ),
              ),
              ListTile(
                title: const Text('Female'),
                leading: Radio(
                  value: 'female',
                  groupValue: genderSelected,
                  onChanged: (value) {
                    setState(() {
                      genderSelected = value!;
                    });
                    handleGetList(searchQuery, value);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ContactProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(
              onSearch: (query) {
                setState(() {
                  searchQuery = query;
                });
                handleGetList(query, genderSelected);
              },
              onTapFilter: onTapFilter,
            ),
            provider.isLoading
                ? Expanded(child: Center(child: CircularProgressIndicator()))
                : buildList(provider.contacts)
          ],
        ),
      ),
    );
  }
}
