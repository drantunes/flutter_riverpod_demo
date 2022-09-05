import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/providers/notes/notes_view_options.dart';
import 'package:flutter_riverpod_demo/providers/notes/view_filtered_provider.dart';

class EmptyNotes extends StatelessWidget {
  const EmptyNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final viewOption = ref.watch(filterNotesProvider).value;
      final String noteType =
          viewOption == NotesViewOptions.archived ? 'Nenhuma nota arquivada.' : 'Crie sua primeira nota!';

      return Column(
        children: [
          Image.asset('assets/empty_notes.png'),
          Text(
            noteType,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      );
    });
  }
}
