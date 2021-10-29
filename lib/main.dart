import 'package:notes_flutter/db/note_dp.dart';
import 'package:notes_flutter/db/task_dp.dart';
import 'package:notes_flutter/models/task.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_flutter/models/note.dart';
import 'package:notes_flutter/screens/home.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(NoteAdapter())
    ..registerAdapter(TaskAdapter());

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<NoteDB>(
          create: (context) => NoteDB(),
        ),
        ChangeNotifierProvider<TaskDB>(
          create: (context) => TaskDB(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
