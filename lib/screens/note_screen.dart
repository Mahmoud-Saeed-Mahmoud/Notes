import 'package:flutter/material.dart';
import 'package:notes_flutter/models/note.dart';
import 'package:notes_flutter/themes/text_theme.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({
    Key? key,
    required this.note,
  }) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 10,
              ),
              child: Text(
                note.title,
                style: CustomTextStyle.titleTheme,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 19,
              ),
              child: Text(
                note.text,
                style: CustomTextStyle.bodyTheme,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
