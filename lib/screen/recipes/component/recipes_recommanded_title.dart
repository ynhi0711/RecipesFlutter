import 'package:flutter/material.dart';

import '../../../const.dart';

class RecipesRecommendedTitle extends StatelessWidget {
  const RecipesRecommendedTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Recommended',
            style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          TextButton(
            style: TextButton.styleFrom(primary: Const.primaryColor),
            onPressed: () {},
            child: Text(
              'SEE ALL',
              style: TextStyle(
                  color: Const.primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}
