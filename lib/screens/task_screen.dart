import 'package:flutter/material.dart';
import 'package:notes_flutter/models/task.dart';
import 'package:notes_flutter/themes/text_theme.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

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
                task.task,
                style: CustomTextStyle.titleTheme,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
