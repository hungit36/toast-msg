import 'dart:async';

import 'package:flutter/material.dart';
import 'package:toast_msg/model/toast_model.dart';
import 'package:toast_msg/toast_stream.dart';
import 'package:toast_msg/widget/toast_msg_widget.dart';

enum ToastPosition { top, center, bottom}

class ToastMsgMain extends StatefulWidget {
  const ToastMsgMain({
    super.key, 
    required this.child, 
    this.position = ToastPosition.bottom, 
    this.positionValue = 0,
    this.margin = EdgeInsets.zero,
    this.borderRadius,
    });
  final Widget child;
  final ToastPosition position;
  final double positionValue;
  final EdgeInsets margin;
  final BorderRadius? borderRadius;
  @override
  State<ToastMsgMain> createState() => _WidgetState();
}

class _WidgetState extends State<ToastMsgMain> {
  Timer? _timer;
  StreamSubscription<ToastData>? _stream;

  ToastData? _toastBody;

  @override
  void initState() {
    super.initState();
    _stream = ToastMsgStream.instance.stream.listen((event) async {
      setState(() {
        _toastBody = event;
      });
      _timer?.cancel();
      const oneSec = Duration(seconds: 4);
      _timer = Timer.periodic(
        oneSec,
        (Timer timer) {
          setState(() {
            _toastBody = null;
            _timer?.cancel();
            timer.cancel();
          });
        },
      );
    });
  }

  @override
  void dispose() {
    _stream?.cancel();
    _timer?.cancel();
    _toastBody = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
              children: [
                widget.child,
                if (_toastBody != null && (_toastBody?.title.isNotEmpty == true || _toastBody?.customTitle != null)) ... [
                  if (widget.position == ToastPosition.center)
                    Align(
                      alignment: Alignment.center,
                      child: ToastMessageWidget(
                        margin: widget.margin,
                        borderRadius: widget.borderRadius,
                        data: _toastBody!, 
                        onHide: () => setState(() {
                          _toastBody = null;
                          _timer?.cancel();
                          },
                        ),
                      ),
                    )
                  else 
                    Positioned(
                      top: widget.position == ToastPosition.top ? widget.positionValue : null,
                      bottom: widget.position == ToastPosition.bottom ? widget.positionValue : null,
                      child: ToastMessageWidget(
                        margin: widget.margin,
                        borderRadius: widget.borderRadius,
                        data: _toastBody!, 
                        onHide: () => setState(() {
                          _toastBody = null;
                          _timer?.cancel();
                        },
                      ),
                    ),
                  ),
                ]
          ],
        ),
    );
  }
}