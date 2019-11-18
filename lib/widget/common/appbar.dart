import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/widget/common/title.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CommonAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CommonTitle(title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
