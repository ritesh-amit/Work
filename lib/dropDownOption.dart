import 'package:flutter/material.dart';
import 'package:spare/sellItem.dart';
import 'SizeConfig.dart';

class Option {
  String option;
  Option(this.option);
  static List<Option> getOption() {
    return <Option>[
      Option('Value 1'),
      Option('Value 2'),
      Option('Value 3'),
      Option('Value 4'),
      Option('Value 5'),
      Option('Value 6'),
    ];
  }
}

class DropDownMenuBar extends StatefulWidget {
  final passKey;
  DropDownMenuBar({
    @required this.passKey,
  });

  @override
  _DropDownMenuBarState createState() => _DropDownMenuBarState();
}

class _DropDownMenuBarState extends State<DropDownMenuBar> {
  List<Option> _option = Option.getOption();
  List<DropdownMenuItem<Option>> _dropdownMenuItemsTime;
  Option _selectedTime;
  @override
  void initState() {
    _dropdownMenuItemsTime = buildDropdownMenuItemsTime(_option);
    _selectedTime = _dropdownMenuItemsTime[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Option>> buildDropdownMenuItemsTime(List options) {
    List<DropdownMenuItem<Option>> items = List();

    for (Option options in options) {
      items.add(
        DropdownMenuItem(
          value: options,
          child: Container(
            child: Text(
              options.option,
              style: TextStyle(
                fontSize: SizeConfig.screenWidth * 14 / 360,
              ),
            ),
          ),
        ),
      );
    }
    return items;
  }

  onchangeDropdownItemOption(Option selectedOption) {
    setState(() {
      _selectedTime = selectedOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.screenHeight / 640;
    var b = SizeConfig.screenWidth / 360;

    return Wrap(children: [
      DropdownButtonHideUnderline(
        child: ButtonTheme(
          layoutBehavior: ButtonBarLayoutBehavior.constrained,
          height: h * 20,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
          child: DropdownButton(
            iconEnabledColor: blc,
            style: txtS(Colors.grey[500], 20, FontWeight.w400),
            isDense: true,
            value: _selectedTime,
            items: _dropdownMenuItemsTime,
            onChanged: onchangeDropdownItemOption,
          ),
        ),
      ),
    ]);
  }

  TextStyle txtS(Color col, double siz, FontWeight wg) {
    return TextStyle(
      color: col,
      fontWeight: wg,
      fontSize: SizeConfig.screenWidth * siz / 360,
    );
  }
}
