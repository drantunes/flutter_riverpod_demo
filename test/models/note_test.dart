import 'package:flutter/material.dart';
import 'package:flutter_riverpod_demo/models/note.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Create a Note', (tester) async {
    final note = Note(
      title: 'Teste Note',
      description: 'Descrição',
      color: Colors.amber,
    );
    expect(note.title, 'Teste Note');
  });
}
