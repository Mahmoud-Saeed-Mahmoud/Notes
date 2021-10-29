import 'package:quick_actions/quick_actions.dart';

class ShortcutItems {
  static const items = <ShortcutItem>[
    actionAddNote,
    actionAddTask,
  ];

  static const actionAddNote = ShortcutItem(
    type: 'add_note',
    localizedTitle: 'Add Note',
    icon: 'icon_add_note',
  );
  static const actionAddTask = ShortcutItem(
    type: 'add_task',
    localizedTitle: 'Add Task',
    icon: 'icon_add_task',
  );
}
