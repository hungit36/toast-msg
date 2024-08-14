import 'package:flutter/material.dart';
import 'package:toast_msg/model/toast_model.dart';
import 'package:toast_msg/widget/shadown_custom.dart';

class ToastMessageWidget extends StatelessWidget {
  const ToastMessageWidget({
    super.key,
    required this.data,
    required this.onHide,
    required this.margin,
    required this.borderRadius,
  });

  final ToastData data;
  final EdgeInsets margin;
  final BorderRadius? borderRadius;
  final void Function() onHide;

  @override
  Widget build(BuildContext context) {
    
    final w = MediaQuery.of(context).size.width - margin.left - margin.right;
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        int sensitivity = 8;
        if (details.delta.dy > sensitivity) {
          // Down Swipe
          onHide();
        } else if (details.delta.dy < -sensitivity) {
          // Up Swipe
        }
      },
      child: Container(
        width: w,
        padding: const EdgeInsets.all(12),
        margin: margin,
        decoration: BoxDecoration(
            boxShadow: data.boxShadow ?? [ShadowsCustom.elevation02],
            color: data.backgroundColor,
            borderRadius: borderRadius,
            border: Border.all(color: data.borderColor)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (data.iconWidget != null) ...[
              data.iconWidget!,
              const SizedBox(width: 8),
            ],
            
            Expanded(
              child: data.customTitle ??
                  Text(
                    data.title,
                    style: data.titleStyle,
                    textAlign: data.textAlign,
                  ),
            )
          ],
        ),
      ),
    );
  }
}