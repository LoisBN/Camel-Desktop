import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final List<Widget> children;

  const CustomBottomBar({this.children});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 3,
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}
