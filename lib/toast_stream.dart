import 'dart:async';

import 'package:toast_msg/model/toast_model.dart';

class ToastMsgStream {
  static final ToastMsgStream instance = ToastMsgStream();

  ToastMsgStream() {
    _controller.add(ToastData());
  }

  final _controller = StreamController<ToastData>.broadcast();

  Stream<ToastData> get stream => _controller.stream;

  ToastData _last = ToastData();
  ToastData get last => _last;

  void showToast(ToastData value) {
    if (_last != value) {
      _last = value;
      _controller.add(value);
    }
  }
}