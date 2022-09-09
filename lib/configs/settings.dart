import 'package:flutter/material.dart';

class Settings {
  Settings._();
  static final instance = Settings._();

  Future<void> initialize() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () => debugPrint('Settings Loaded: ${DateTime.now()}'),
    );
  }
}
