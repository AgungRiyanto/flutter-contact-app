import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Function(String q) onSearch;
  final Function() onTapFilter;

  const Header({Key? key, required this.onSearch, required this.onTapFilter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Contacts',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(onPressed: onTapFilter, icon: Icon(Icons.tune))
            ],
          ),
          SizedBox(
            height: 13,
          ),
          TextField(
            onSubmitted: onSearch,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.circular(100.0),
              ),
              filled: true,
              fillColor: Colors.grey[300],
              contentPadding: EdgeInsets.symmetric(vertical: 8),
            ),
          )
        ],
      ),
    );
  }
}
