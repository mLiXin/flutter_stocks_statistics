import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/widget/common/title.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  const CommonAppBar(this.title, {this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CommonTitle(title),
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
