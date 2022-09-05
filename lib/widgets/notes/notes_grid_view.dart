import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/models/note.dart';
import 'package:flutter_riverpod_demo/providers/notes/view_toogle_provider.dart';
import 'package:flutter_riverpod_demo/repositories/notes_repository.dart';
import 'package:flutter_riverpod_demo/widgets/empty_notes.dart';
import 'package:flutter_riverpod_demo/widgets/notes/note_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NotesGridView extends ConsumerStatefulWidget {
  const NotesGridView({Key? key}) : super(key: key);

  @override
  ConsumerState<NotesGridView> createState() => _NotesGridViewState();
}

class _NotesGridViewState extends ConsumerState<NotesGridView> with SingleTickerProviderStateMixin {
  final duration = const Duration(milliseconds: 150);
  late final AnimationController animation;
  int columnsCount = 2;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(vsync: this, duration: duration);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ref.read(notesViewModeProvider.notifier).addListener(runTransitionGridView);
    animation.forward();
  }

  runTransitionGridView() {
    animation.value = 0;

    Future.delayed(duration).then((value) {
      columnsCount = columnsCount == 1 ? 2 : 1;
      animation.forward(from: 0);
    });
  }

  @override
  void dispose() {
    ref.read(notesViewModeProvider.notifier).removeListener(runTransitionGridView);
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Note> notes = ref.watch(notesListProvider);

    return notes.isEmpty
        ? const EmptyNotes()
        : AnimatedBuilder(
            animation: animation,
            builder: (context, _) => MasonryGridView.count(
              itemCount: notes.length,
              crossAxisCount: columnsCount,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              itemBuilder: (context, index) => AnimatedScale(
                scale: animation.value,
                duration: duration,
                child: NoteCard(
                  note: notes[index],
                ),
              ),
            ),
          );
  }
}
