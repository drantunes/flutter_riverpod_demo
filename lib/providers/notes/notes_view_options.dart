import 'package:flutter/material.dart';

enum NotesViewOptions {
  column(icon: Icon(Icons.grid_view_rounded), tooltip: 'Grtid View'),
  grid(icon: Icon(Icons.view_agenda_rounded), tooltip: 'Column View'),
  inbox(icon: Icon(Icons.archive_rounded), tooltip: 'Show Archive'),
  archived(icon: Icon(Icons.inbox_rounded), tooltip: 'Show Inbox');

  const NotesViewOptions({required this.icon, required this.tooltip});

  final Icon icon;
  final String tooltip;
}
