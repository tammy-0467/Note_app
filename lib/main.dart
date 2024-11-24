import 'package:flutter/material.dart';
import 'package:notesapp/pages/settings.dart';
import 'package:notesapp/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'models/note_database.dart';
import 'pages/home_page.dart';

Future<void> main() async {
  //initialize note isar database

  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NoteDatabase(),
        ),
        ChangeNotifierProvider(
            create: (context)=> ThemeProvider(),
        )
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/settings_page': (context) => const Settings()
      },
      theme: Provider.of<ThemeProvider>(context).themeData,
     );
  }
}
