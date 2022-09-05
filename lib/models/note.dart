import 'package:flutter/material.dart';

class Note {
  final String title;
  final String description;
  final MaterialColor color;
  final bool archived;

  Note({
    required this.title,
    required this.description,
    required this.color,
    this.archived = false,
  });

  Note copyWith({
    String? title,
    String? description,
    MaterialColor? color,
    bool? archived,
  }) {
    return Note(
      title: title ?? this.title,
      description: description ?? this.description,
      color: color ?? this.color,
      archived: archived ?? this.archived,
    );
  }
}
