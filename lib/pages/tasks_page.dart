import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'package:notes_flutter/db/task_dp.dart';
import 'package:notes_flutter/models/task.dart';
import 'package:notes_flutter/screens/task_screen.dart';
import 'package:notes_flutter/themes/text_theme.dart';

class TasksPage extends StatelessWidget {
  TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: context.watch<TaskDB>().taskList.length,
      itemBuilder: (BuildContext context, int index) {
        Task task = context.watch<TaskDB>().taskList[index];
        return GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) =>
                  TaskScreen(task: context.read<TaskDB>().taskList[index]),
            ),
          ),
          child: Dismissible(
            key: ObjectKey(context.read<TaskDB>().taskList[index]),
            onDismissed: (direction) => context.read<TaskDB>().deletTask(index),
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
            child: ListTile(
              title: Container(
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
                      task.task,
                      style: CustomTextStyle.titleTheme,
                    ),
                  ],
                ),
              ),
              trailing: Checkbox(
                value: task.completed,
                onChanged: (newVal) => context.read<TaskDB>().updateTask(
                    index,
                    Task(
                      task: task.task,
                      completed: newVal!,
                    )),
              ),
            ),
          ),
        );
      },
    );
  }
}
