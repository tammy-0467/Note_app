import 'package:flutter/material.dart';
import 'package:notesapp/components/my_drawer.dart';
import 'package:notesapp/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {

  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("Settings"),
      elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Change Theme"),
              Switch(
                  activeColor: Theme.of(context).colorScheme.primary,
                  activeTrackColor: Theme.of(context).colorScheme.onSurface,
                  value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
                  onChanged: (value){
                    Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                  }
              ),
            ],
          ),
        ),
      )
    );
  }
}

