import 'package:flutter/material.dart';

import 'follow_button.dart';

class RecipesDetailInfo extends StatelessWidget {
  const RecipesDetailInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            height: screenSize.width * 0.25,
            width: screenSize.width * 0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/avatar.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Elisabeth',
                style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              RichText(
                text: TextSpan(
                    text: '1.704',
                    style: TextStyle(
                        color: Color(0xFF666666),
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                    children: [
                      TextSpan(
                          text: ' Followers',
                          style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 12,
                              fontWeight: FontWeight.w500))
                    ]),
              ),
              SizedBox(height: 10),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 25.0, bottom: 15),
                child: FollowButton(screenSize: screenSize),
              ),
            ),
          )
        ],
      ),
    );
  }
}
