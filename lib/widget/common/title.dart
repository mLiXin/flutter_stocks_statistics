import 'package:flutter/material.dart';

class CommonTitle extends StatelessWidget {
  final String title;

  const CommonTitle(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(title, style: TextStyle(fontSize: 18, color: Colors.white));
  }
}
