import 'dart:async';
import 'package:flutter/material.dart';

class Debounce {
  Timer? _timer;
  int milliseconds;
  Debounce([this.milliseconds = 300]);

  void debounce(VoidCallback action) {
    if (_timer?.isActive ?? false) _timer?.cancel();

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
