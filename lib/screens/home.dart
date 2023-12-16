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
  @override
  void initState() {
    super.initState();
    final contactProvider =
        Provider.of<ContactProvider>(context, listen: false);
    contactProvider.getContactList(context);
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

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ContactProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [Header(), buildList(provider.contacts)],
        ),
      ),
    );
  }
}
