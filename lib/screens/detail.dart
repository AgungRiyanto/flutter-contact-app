import 'package:flutter/material.dart';
import 'package:flutter_contact_app/models/contact.dart';

class Detail extends StatefulWidget {
  final Contact detail;
  const Detail({Key? key, required this.detail}) : super(key: key);

  @override
  _DetailState createState() => _DetailState(detail: detail);
}

class _DetailState extends State<Detail> {
  late final Contact detail;
  _DetailState({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.chevron_left)),
            ),
            Center(
              child: Hero(
                tag: 'avatar' + detail.name,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(detail.avatar),
                  radius: 80.0,
                ),
              ),
            ),
            SizedBox(height: 13),
            Center(
              child: Hero(
                tag: detail.name,
                child: Text(
                  detail.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 13),
              padding: EdgeInsets.symmetric(vertical: 13),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.phone_android_outlined),
                  SizedBox(width: 10),
                  Text(detail.phone)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 13),
              padding: EdgeInsets.symmetric(vertical: 13),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.email_outlined),
                  SizedBox(width: 10),
                  Text(detail.email)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 13),
              padding: EdgeInsets.symmetric(vertical: 13),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              child: Row(
                children: [
                  Icon(detail.gender == 'male'
                      ? Icons.male_outlined
                      : Icons.female_outlined),
                  SizedBox(width: 10),
                  Text(detail.gender)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
