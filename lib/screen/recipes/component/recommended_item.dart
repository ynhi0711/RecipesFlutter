import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipes_flutter/model/food.dart';

class RecommendedItem extends StatefulWidget {
  const RecommendedItem({
    Key key,
    @required this.screenSize,
    @required this.foods,
    @required this.index,
    @required this.onClick,
  }) : super(key: key);

  final Size screenSize;
  final List<Food> foods;
  final int index;
  final Function onClick;

  @override
  _RecommendedItemState createState() => _RecommendedItemState();
}

class _RecommendedItemState extends State<RecommendedItem> {
  @override
  Widget build(BuildContext context) {
    var _itemHeight = widget.screenSize.height * 0.3;
    return Wrap(
      children: [
        GestureDetector(
          onTap: widget.onClick,
          child: Container(
            margin: EdgeInsets.only(
                left: widget.index == 0 ? 25 : 10,
                right: widget.index == (widget.foods.length - 1) ? 25 : 10,
                top: 10,
                bottom: 10),
            width: widget.screenSize.width * 0.55,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFE3E3E3),
                    blurRadius: 10,
                    offset: Offset(0, 1),
                  )
                ]),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // height: _itemHeight * 0.47,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Container(
                          width: widget.screenSize.width * 0.6,
                          child: Image.asset(
                            widget.foods[widget.index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: Text(
                        widget.foods[widget.index].name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                        children:
                            buildFoodTagView(widget.foods[widget.index].tags)),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 13, vertical: 8),
                          child: RatingBarIndicator(
                            unratedColor: Color(0xFFCCCCCC),
                            rating: widget.foods[widget.index].rating,
                            itemPadding: EdgeInsets.all(2),
                            itemBuilder: (context, index) => SvgPicture.asset(
                              'assets/icons/ic_star.svg',
                              color: Color(0xFFEFD358),
                            ),
                            itemCount: 5,
                            itemSize: 12.0,
                            direction: Axis.horizontal,
                          ),
                        ),
                        Text(
                          '${widget.foods[widget.index].rating}',
                          style: TextStyle(
                              color: Color(0xFF666666),
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(32, 32),
                        backgroundColor: Color(0x4D000000),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          widget.foods[widget.index].isSelected =
                              !_getSafetyBoolean(
                                  widget.foods[widget.index].isSelected);
                        });
                      },
                      child: SvgPicture.asset('assets/icons/ic_heart.svg',
                          color: _getSafetyBoolean(
                                  widget.foods[widget.index].isSelected)
                              ? Colors.white
                              : Color(0xFFC4C4C4))),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  bool _getSafetyBoolean(bool value) => value ?? false;

  List<Widget> buildFoodTagView(List<String> tags) {
    List<Widget> widgets = [];
    tags.forEach((element) {
      widgets.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          element,
          style: TextStyle(
              color: Color(0xFFCCCCCC),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
      ));
    });
    return widgets;
  }
}
