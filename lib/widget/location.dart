import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LocationWidget extends StatelessWidget {

  String secilenSehir;

  LocationWidget({@required this.secilenSehir});

  @override
  Widget build(BuildContext context) {
    return Text(secilenSehir, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),);
  }
}
