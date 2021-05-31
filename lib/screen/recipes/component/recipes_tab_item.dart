import 'package:flutter/material.dart';

import '../../../const.dart';

class RecipesTabItem extends StatefulWidget {
  final int index;
  final String title;
  final Function press;
  final int currentIndex;
  bool isSelected() {
    return index == currentIndex;
  }

  const RecipesTabItem(
      {Key key, this.index, this.title, this.press, this.currentIndex})
      : super(key: key);

  @override
  _RecipesTabItemState createState() => _RecipesTabItemState();
}

class _RecipesTabItemState extends State<RecipesTabItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: TextButton(
        style: TextButton.styleFrom(primary: Const.primaryColor),
        onPressed: widget.press,
        child: Text(
          widget.title,
          style: TextStyle(
              color:
                  widget.isSelected() ? Color(0xFF333333) : Color(0xFF999999),
              fontWeight: FontWeight.w600,
              fontSize: 12),
        ),
      ),
    );
  }
}
