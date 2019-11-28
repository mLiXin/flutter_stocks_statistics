import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/constant/color.dart';

class CommonItem extends StatelessWidget {
  final String itemName;

  CommonItem(this.itemName)
      : assert(
          itemName != null,
          'Need ItemName',
        );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 50,
      color: Molor.background_white,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20,right: 20),
      child: Text(
        itemName,
        style: TextStyle(fontSize: 15,color: Colors.black87),
      ),
    );
  }
}
