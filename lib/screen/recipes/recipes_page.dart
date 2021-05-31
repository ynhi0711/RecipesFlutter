import 'package:flutter/material.dart';
import 'package:recipes_flutter/const.dart';
import 'package:recipes_flutter/model/food.dart';
import 'package:recipes_flutter/screen/recipes_detail/recipes_detail_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'component/recipes_detail_info.dart';
import 'component/recipes_recommanded_title.dart';
import 'component/recipes_tab_item.dart';
import 'component/recommended_item.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({
    Key key,
  }) : super(key: key);

  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  final PageController _pageController = PageController(initialPage: 0);
  List<Food> foods = [
    Food(1, 'Granola with fruits', 'assets/images/food1.png', 4.5,
        ['Breakfast', 'Light food'],
        isSelected: true),
    Food(2, 'Cheesecake', 'assets/images/food2.png', 5.0,
        ['Dinner', 'Light food'],
        isSelected: false),
    Food(3, 'Banh bot loc', 'assets/images/food3.png', 4.0,
        ['Breakfast', 'Light food']),
    Food(4, 'Apple crumble', 'assets/images/food1.png', 4.5,
        ['Lunch', 'Fast food']),
    Food(5, 'Australian and New Zealand meat pie', 'assets/images/food2.png',
        3.0, ['Dinner', 'Light food']),
  ];

  int _indicatorActiveIndex = 0;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    // var itemHeight = screenSize.height * 0.27;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Container(
                height: double.minPositive,
                color: Colors.white,
                child: Stack(
                  children: [
                    Positioned(
                      height: screenSize.height * 0.26,
                      width: screenSize.width,
                      child: Container(
                          child: Image.asset(
                        'assets/images/banner.png',
                        fit: BoxFit.cover,
                      )),
                    ),
                    Positioned(
                        left: 0,
                        right: 0,
                        top: screenSize.height * 0.225,
                        child: RecipesDetailInfo()),
                    Positioned(
                      left: 10,
                      right: 0,
                      top: screenSize.height * 0.37,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              RecipesTabItem(
                                index: 0,
                                title: 'Recipes',
                                press: () {
                                  setState(() {
                                    _indicatorActiveIndex = 0;
                                    goTopage(0);
                                  });
                                },
                                currentIndex: _indicatorActiveIndex,
                              ),
                              RecipesTabItem(
                                  index: 1,
                                  title: 'Galleries',
                                  press: () {
                                    setState(() {
                                      _indicatorActiveIndex = 1;
                                      goTopage(1);
                                    });
                                  },
                                  currentIndex: _indicatorActiveIndex),
                              RecipesTabItem(
                                  index: 2,
                                  title: 'Story',
                                  press: () {
                                    setState(() {
                                      _indicatorActiveIndex = 2;
                                      goTopage(2);
                                    });
                                  },
                                  currentIndex: _indicatorActiveIndex),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 30),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2)),
                                color: Color(0xFFE5E5E5)),
                            height: 3,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: screenSize.height * 0.04,
                      left: 30,
                      child: AnimatedSmoothIndicator(
                          activeIndex: _indicatorActiveIndex,
                          count: 3,
                          effect: ExpandingDotsEffect(
                            dotHeight: 5,
                            dotColor: Color(0xFFC4C4C4),
                            activeDotColor: Const.primaryColor,
                            dotWidth: 5,
                            expansionFactor: 4,
                            radius: 5,
                            spacing: 5,
                          )),
                    ),
                    Positioned(
                        top: screenSize.height * 0.45,
                        left: 0,
                        right: 0,
                        bottom: screenSize.height * 0.04,
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _indicatorActiveIndex = index;
                            });
                          },
                          children: [
                            Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RecipesRecommendedTitle(),
                                  Expanded(
                                    child: Container(
                                      child: ListView.builder(
                                        itemCount: foods.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return RecommendedItem(
                                            screenSize: screenSize,
                                            foods: foods,
                                            index: index,
                                            onClick: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          RecipesDetailScreen()));
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Center(child: Text('Galleries is empty')),
                            ),
                            Container(
                              child: Center(child: Text('Story is empty')),
                            )
                          ],
                        ))
                  ],
                ),
              )));
    });
  }

  goTopage(int index) {
    setState(() {
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }
}
