import 'package:flutter/material.dart';
import 'package:flutter_contact_app/models/contact.dart';

class ContactListItem extends StatelessWidget {
  final Contact item;
  final void Function() onTap;
  const ContactListItem({Key? key, required this.item, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        child: Row(
          children: [
            Hero(
              tag: 'avatar' + item.name,
              child: CircleAvatar(
                backgroundImage: NetworkImage(item.avatar),
              ),
            ),
            SizedBox(
              width: 13,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                    tag: item.name,
                    child: Text(
                      item.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    )),
                Text(
                  item.phone,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
