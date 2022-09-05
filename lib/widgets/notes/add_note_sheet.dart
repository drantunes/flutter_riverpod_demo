import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/models/note.dart';
import 'package:flutter_riverpod_demo/repositories/notes_repository.dart';
import 'package:flutter_riverpod_demo/widgets/notes/color_selector_button.dart';

class AddNoteSheet extends ConsumerStatefulWidget {
  const AddNoteSheet({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<AddNoteSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends ConsumerState<AddNoteSheet> {
  final _formKey = GlobalKey<FormState>();
  final _noteTitle = TextEditingController();
  final _noteDescription = TextEditingController();
  final _paddingNotifier = ValueNotifier<double>(6);
  final _colorSelector = ValueNotifier<MaterialColor>(Colors.grey);
  final _size = 425.0;

  saveNote() {
    if (_formKey.currentState!.validate()) {
      ref.read(notesRepositoryProvider.notifier).addNote(
            Note(
              title: _noteTitle.text,
              description: _noteDescription.text,
              color: _colorSelector.value,
            ),
          );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: _paddingNotifier,
      builder: (context, double padding, _) {
        return Padding(
          padding: EdgeInsets.only(
            left: 12,
            right: 12,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ValueListenableBuilder(
              valueListenable: _colorSelector,
              builder: (context, MaterialColor selectedColor, _) {
                return Container(
                  height: _size,
                  // margin: EdgeInsets.only(
                  //   bottom: (MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom) / 2 - (_size / 2),
                  // ),
                  decoration: BoxDecoration(
                    color: selectedColor.shade50,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Adicionar Nota',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ],
                          ),
                          const Divider(thickness: 1, height: 6),
                          Padding(
                            padding: const EdgeInsets.only(top: 12, bottom: 6),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Titulo'),
                              ),
                              controller: _noteTitle,
                              validator: (value) {
                                if (value!.isEmpty) return "Informe o título para a nota";

                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: padding),
                            child: TextFormField(
                              minLines: 3,
                              maxLines: 3,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Descrição...',
                                // label: Text("Comentário"),
                              ),
                              controller: _noteDescription,
                              validator: (value) {
                                if (value!.isEmpty) return "Escreva uma descrição para a nota";

                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Colors.grey,
                                Colors.amber,
                                Colors.teal,
                                Colors.blue,
                                Colors.deepPurple,
                                Colors.deepOrange,
                                Colors.pink,
                                Colors.brown,
                              ]
                                  .map(
                                    (MaterialColor color) => ColorSelectorButton(
                                      colorBase: color,
                                      selectedColor: selectedColor,
                                      onSelected: () => _colorSelector.value = color,
                                    ),
                                  )
                                  .expand((element) => [element, const SizedBox(width: 10)])
                                  .toList(),
                            ),
                          ),
                          const Expanded(
                            child: SizedBox.shrink(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () => saveNote(),
                                child: const Text('Salvar Nota'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
