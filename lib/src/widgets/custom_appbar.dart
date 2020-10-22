import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget leading;
  final Widget title;
  final List<Widget> actions;
  final PreferredSizeWidget bottom;
  final ShapeBorder shape;
  final bool centerTitle;
  final IconThemeData leadingTheme;
  final IconThemeData actionsTheme;
  final Color backgroundColor;

  const CustomAppBar(
      {this.leading,
      @required this.title,
      @required this.actions,
      this.bottom,
      this.shape,
      this.centerTitle,
      this.leadingTheme,
      this.actionsTheme,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 3,
      leading: leading,
      title: title,
      actions: actions,
      bottom: bottom,
      centerTitle: centerTitle,
      shape: shape,
    );
  }

  final Size preferredSize = const Size.fromHeight(kToolbarHeight + 5);
}
