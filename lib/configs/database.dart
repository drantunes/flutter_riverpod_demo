import 'package:flutter/material.dart';

class Database {
  Database._();

  static Future<void> open({required String table}) async {
    await Future.delayed(
      const Duration(seconds: 1),
      () => debugPrint('Database Opened: ${DateTime.now()}'),
    );
  }
}
