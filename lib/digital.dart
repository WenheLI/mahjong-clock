import 'dart:async';

import 'package:clocks/Majong.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'clockHelper/model.dart';

enum _Element {
  background,
  text,
  shadow
}

final _lightTheme = {
  _Element.background: Color(0xFF81B3FE),
  _Element.text: Colors.white,
  _Element.shadow: Colors.black,
};

final _darkTheme = {
  _Element.background: Colors.black,
  _Element.text: Colors.white,
  _Element.shadow: Color(0xFF174EA6),
};

class DigitalClock extends StatefulWidget {
  const DigitalClock(this.model);

  final ClockModel model;

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(DigitalClock oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {

    });
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      _timer = Timer(
        Duration(minutes: 1) - Duration(seconds: _dateTime.second) - Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).brightness == Brightness.light
                    ? _lightTheme
                    : _darkTheme;
    final hour =
    DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
    final minute = DateFormat('mm').format(_dateTime);
    final fontSize = MediaQuery.of(context).size.width / 3.5;
    final offset = -fontSize / 7;

    final defaultStyle = TextStyle(
      color: colors[_Element.text],
      fontSize: fontSize,
      shadows: [
        Shadow(
          blurRadius: 0,
          color: colors[_Element.shadow],
          offset: Offset(10, 0)
        )
      ]
    );

    return Container(
      color: colors[_Element.background],
      child: Center(
        child:Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: MahjongList()),
              Expanded(child: MahjongList()),
              Expanded(child: Mahjong("_")),
              Expanded(child: MahjongList()),
              Expanded(child: MahjongList()),
            ],
        ),
      ),
    );
  }
}