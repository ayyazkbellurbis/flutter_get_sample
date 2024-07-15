import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Color? backgroundColor;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomAppBar(
      {Key? key,
      this.title,
      this.backgroundColor = Colors.white,
      this.leading,
      this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      leading: leading,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
