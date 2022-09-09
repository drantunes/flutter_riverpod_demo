import 'package:flutter/material.dart';

class RemoteConfig {
  RemoteConfig._();
  static final instance = RemoteConfig._();

  Future<void> getConfigs() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () => debugPrint('Configs Loaded: ${DateTime.now()}'),
    );
  }

  Future<void> loadExperiments() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () => debugPrint('Experiments Loaded: ${DateTime.now()}'),
    );
  }
}
