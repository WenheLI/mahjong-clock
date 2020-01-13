import 'package:clocks/clockHelper/customizer.dart';
import 'package:clocks/clockHelper/model.dart';
import 'package:clocks/digital.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ClockCustomizer((ClockModel model) => DigitalClock(model)));
}