import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:notes_flutter/db/task_dp.dart';
import 'package:notes_flutter/shortcuts.dart';
import 'package:provider/provider.dart';

import 'package:notes_flutter/db/note_dp.dart';
import 'package:notes_flutter/pages/notes_page.dart';
import 'package:notes_flutter/pages/tasks_page.dart';
import 'package:notes_flutter/screens/add_note_screen.dart';
import 'package:notes_flutter/themes/text_theme.dart';
import 'package:quick_actions/quick_actions.dart';

import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  final QuickActions _quickActions = const QuickActions();

  @override
  void initState() {
    super.initState();

    controller = TabController(
      length: 2,
      vsync: this,
    );

    initQuickActions();
  }

  initQuickActions() {
    _quickActions.initialize((type) {
      if (type == ShortcutItems.actionAddNote.type) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => AddNoteScreen(),
          ),
        );
      } else if (type == ShortcutItems.actionAddTask.type) {}
    });
    _quickActions.setShortcutItems(ShortcutItems.items);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<NoteDB>().queryNotes();
    context.watch<TaskDB>().queryTasks();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          controller.index == 0 ? 'Notes' : 'Tasks',
          style: CustomTextStyle.titleTheme,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete_rounded,
            ),
            onPressed: () {
              controller.index == 0
                  ? context.read<NoteDB>().deletAllNotes()
                  : context.read<TaskDB>().deletAllTasks();
            },
          ),
        ],
        elevation: 0,
        bottom: TabBar(controller: controller, tabs: const [
          Tab(
            text: 'Notes',
            icon: Icon(
              Icons.note_alt,
            ),
          ),
          Tab(
            text: 'Tasks',
            icon: Icon(
              Icons.task_rounded,
            ),
          ),
        ]),
      ),
      body: TabBarView(controller: controller, children: [
        const NotesPage(),
        TasksPage(),
      ]),
      floatingActionButton: SpeedDial(
        overlayOpacity: 0,
        animatedIcon: AnimatedIcons.menu_close,
        spacing: 10,
        spaceBetweenChildren: 5,
        children: [
          SpeedDialChild(
            label: 'Add Note',
            child: const Icon(
              Icons.note_add,
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => AddNoteScreen(),
              ),
            ),
          ),
          SpeedDialChild(
            label: 'Add Task',
            child: const Icon(
              Icons.add_task_rounded,
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => AddTaskScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
