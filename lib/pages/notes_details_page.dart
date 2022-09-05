import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/models/note.dart';
import 'package:flutter_riverpod_demo/repositories/notes_repository.dart';

class NotesDetailsPage extends StatelessWidget {
  final Note note;

  const NotesDetailsPage({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: note.color.shade50,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black87,
        backgroundColor: Colors.transparent,
        actions: [
          Consumer(builder: (context, ref, _) {
            return !note.archived
                ? IconButton(
                    onPressed: () {
                      ref.read(notesRepositoryProvider.notifier).archiveNote(note);
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.archive_rounded),
                  )
                : IconButton(
                    onPressed: () {
                      ref.read(notesRepositoryProvider.notifier).moveNoteToInbox(note);
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.undo),
                  );
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: ListView(
          children: [
            Text(
              note.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            const Divider(height: 36),
            Text(note.description),
          ],
        ),
      ),
    );
  }
}
