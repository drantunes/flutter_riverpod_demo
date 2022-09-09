import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/app.dart';
import 'package:flutter_riverpod_demo/configs/analytics.dart';
import 'package:flutter_riverpod_demo/configs/database.dart';
import 'package:flutter_riverpod_demo/configs/performance_monitoring.dart';
import 'package:flutter_riverpod_demo/configs/remote_config.dart';
import 'package:flutter_riverpod_demo/configs/settings.dart';
import 'package:flutter_riverpod_demo/splash_screen.dart';

void main() async {
  debugPrint('App Starting: ${DateTime.now()}');
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const SplashScreen());

  await Future.wait([
    Settings.instance.initialize(),
    Database.open(table: 'notes'),

    //Setup Remote Config & AB Tests
    RemoteConfig.instance.getConfigs(),
    RemoteConfig.instance.loadExperiments(),

    //Setup Crash & Performance Monitoring
    PerformanceMonitoring.instance.start(env: Enviroment.production),
    //Setup App Analytics
    Analytics.instance.initialize(),
  ]);

  runApp(const ProviderScope(
    child: App(),
  ));

  debugPrint('App Loaded: ${DateTime.now()}');
}
