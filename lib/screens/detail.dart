import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({ Key? key }) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Column(children: [Text('Detail')],),),
    );
  }
}