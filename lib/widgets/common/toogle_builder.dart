import 'package:flutter/material.dart';

class ToggleBuilder<T> extends StatelessWidget {
  final ValueNotifier<T> toggle;
  final Widget Function(BuildContext context, T value) builder;

  const ToggleBuilder({Key? key, required this.toggle, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T>(
      valueListenable: toggle,
      builder: (context, T value, _) => builder(context, value),
    );
  }
}
