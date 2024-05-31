import 'package:flutter/material.dart';

class ToastData {
  String title = '';
  Widget? customTitle;
  TextStyle titleStyle = const TextStyle();
  Color backgroundColor = Colors.white;
  Color borderColor = Colors.white;
  Widget? iconWidget;
  TextAlign textAlign;
  List<BoxShadow>? boxShadow;

  ToastData({
    this.title = '',
    this.customTitle,
    this.titleStyle = const TextStyle(),
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.iconWidget,
    this.boxShadow,
    this.textAlign = TextAlign.left,
  });
}