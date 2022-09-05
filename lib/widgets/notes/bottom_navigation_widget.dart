import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  final List<Widget> buttons;

  const BottomNavigationWidget({
    Key? key,
    required this.buttons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 5,
      shape: const AutomaticNotchedShape(
        RoundedRectangleBorder(),
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      color: Theme.of(context).colorScheme.primary,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ...buttons.expand(
                (button) => [
                  const SizedBox(width: 12),
                  button,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
