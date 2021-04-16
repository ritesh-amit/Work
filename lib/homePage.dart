import 'package:flutter/material.dart';
import 'package:spare/SizeConfig.dart';

import 'dart:ui' show lerpDouble;
import 'package:spare/sellItem.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List items = [1, 2, 3, 4];
  Duration duration = Duration(milliseconds: 170);

  double _getIndicatorPosition(int index) {
    var isLtr = Directionality.of(context) == TextDirection.ltr;
    if (isLtr)
      return lerpDouble(-1.0, 1.0, index / (items.length - 1));
    else
      return lerpDouble(1.0, -1.0, index / (items.length - 1));
  }

  List<Widget> _widget = <Widget>[
    SellPage(),
    SellPage(),
    SellPage(),
    SellPage()
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.screenHeight / 896;
    var b = SizeConfig.screenWidth / 412;

    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: Container(
            color: Colors.transparent,
            height: h * 71,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              AnimatedAlign(
                alignment: Alignment(_getIndicatorPosition(_selectedIndex), 0),
                curve: Curves.linear,
                duration: duration,
                child: Container(
                  color: Color(0xff0faae2) ?? Colors.transparent,
                  width: b * 412 / items.length,
                  height: h * 2,
                ),
              ),
              BottomNavigationBar(
                backgroundColor: Colors.white,
                selectedItemColor: Color(0xff0faae2),
                elevation: 10,
                selectedFontSize: SizeConfig.screenWidth * 14 / 414,
                unselectedFontSize: SizeConfig.screenWidth * 12 / 414,
                unselectedItemColor: Color(0xff130f26),
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.phone),
                    label: 'Menu',
                  ),
                  BottomNavigationBarItem(
                    label: 'Order',
                    icon: Icon(Icons.phone),
                  ),
                  BottomNavigationBarItem(
                    label: 'Pay-In',
                    icon: Icon(Icons.phone),
                  ),
                  BottomNavigationBarItem(
                    label: 'Profile',
                    icon: Icon(Icons.phone),
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ]),
          ),
          body: _widget.elementAt(_selectedIndex)),
    );
  }
}
