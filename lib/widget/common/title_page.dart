import 'package:flutter/material.dart';

class CommonTitlePage extends StatelessWidget {
  final Widget title;
  final Widget body;
  final FloatingActionButton floatingActionButton;

  CommonTitlePage(
      {@required this.title, @required this.body,this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: title,
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
