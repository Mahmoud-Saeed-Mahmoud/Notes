import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'package:notes_flutter/db/note_dp.dart';
import 'package:notes_flutter/models/note.dart';
import 'package:notes_flutter/screens/note_screen.dart';
import 'package:notes_flutter/themes/text_theme.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: context.watch<NoteDB>().noteList.length,
      itemBuilder: (BuildContext context, int index) {
        Note note = context.watch<NoteDB>().noteList[index];
        return GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) =>
                  NoteScreen(note: context.read<NoteDB>().noteList[index]),
            ),
          ),
          child: Dismissible(
            key: ObjectKey(context.read<NoteDB>().noteList[index]),
            onDismissed: (direction) => context.read<NoteDB>().deletNote(index),
            background: Container(
              alignment: Alignment.centerLeft,
              color: Colors.red,
              child: const Icon(
                Icons.delete_rounded,
              ),
            ),
            secondaryBackground: Container(
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: const Icon(
                Icons.delete_rounded,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    style: CustomTextStyle.titleTheme,
                  ),
                  Text(
                    note.text,
                    style: CustomTextStyle.bodyTheme,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
