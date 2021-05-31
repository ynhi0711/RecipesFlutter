import 'package:flutter/material.dart';

import '../../../const.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Const.primaryColor,
        textStyle: TextStyle(
          color: Const.primaryColor,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
        minimumSize: Size(screenSize.width * 0.18, 28),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        backgroundColor: Const.primaryLightColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      onPressed: () {},
      child: Text(
        'Follow',
      ),
    );
  }
}
