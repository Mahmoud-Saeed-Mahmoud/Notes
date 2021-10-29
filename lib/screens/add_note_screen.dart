import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_flutter/db/note_dp.dart';
import 'package:notes_flutter/models/note.dart';
import 'package:notes_flutter/themes/text_theme.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Add Note',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Title',
                hintStyle: CustomTextStyle.titleTheme,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20,
                ),
              ),
            ),
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Start typing ....',
                hintStyle: CustomTextStyle.bodyTheme,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20,
                ),
              ),
              controller: _textController,
              minLines: 1,
              maxLines: double.maxFinite.floor(),
              keyboardType: TextInputType.multiline,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<NoteDB>().addNote(
                Note(
                  title: _titleController.text,
                  text: _textController.text,
                  completed: false,
                ),
              );
          Navigator.of(context).pop();
        },
        child: const Icon(
          FontAwesomeIcons.save,
        ),
      ),
    );
  }
}
