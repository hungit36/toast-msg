import 'package:flutter/material.dart';

enum ToastPosition { top, center, bottom}
class ToastData {
  String title = '';
  Widget? customTitle;
  TextStyle titleStyle = const TextStyle();
  Color backgroundColor = Colors.white;
  Color borderColor = Colors.white;
  Widget? iconWidget;
  TextAlign textAlign;
  ToastPosition position = ToastPosition.bottom;
  List<BoxShadow>? boxShadow;
  final double positionValue;

  ToastData({
    this.title = '',
    this.customTitle,
    this.titleStyle = const TextStyle(),
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.iconWidget,
    this.boxShadow,
    this.textAlign = TextAlign.left,
    this.position = ToastPosition.bottom,
    this.positionValue = 0,
  });
}