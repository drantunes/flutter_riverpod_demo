import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  final Function() onPressed;

  const CustomFloatingButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
