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
    var h = SizeConfig.screenHeight / 640;
    var b = SizeConfig.screenWidth / 360;

    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: Container(
            color: Colors.white,
            height: h * 55,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              AnimatedAlign(
                alignment: Alignment(_getIndicatorPosition(_selectedIndex), 0),
                curve: Curves.linear,
                duration: duration,
                child: Container(
                  color: Color(0xff0faae2) ?? Colors.transparent,
                  width: b * 360 / items.length,
                  height: b * 3,
                ),
              ),
              BottomNavigationBar(
                backgroundColor: Colors.white,
                selectedItemColor: Colors.black,
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
                elevation: 10,
                selectedFontSize: b * 16,
                unselectedFontSize: b * 14,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Container(),
                    label: 'Menu',
                  ),
                  BottomNavigationBarItem(
                    label: 'Order',
                    icon: Container(),
                  ),
                  BottomNavigationBarItem(
                    label: 'Pay-In',
                    icon: Container(),
                  ),
                  BottomNavigationBarItem(
                    label: 'Profile',
                    icon: Container(),
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
