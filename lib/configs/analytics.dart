import 'package:flutter/material.dart';

class Analytics {
  Analytics._();
  static final instance = Analytics._();

  Future<void> initialize() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () => debugPrint('Analytics Loaded: ${DateTime.now()}'),
    );
  }
}
