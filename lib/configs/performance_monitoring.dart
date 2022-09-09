import 'package:flutter/material.dart';

enum Enviroment {
  production,
  development,
  staging,
}

class PerformanceMonitoring {
  PerformanceMonitoring._();
  static final instance = PerformanceMonitoring._();

  Future<void> start({required Enviroment env}) async {
    await Future.delayed(
      const Duration(seconds: 1),
      () => debugPrint('Performance Monitoring Started: ${DateTime.now()}'),
    );
  }
}
