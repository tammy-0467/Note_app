import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,

      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
              child: Icon(
                Icons.edit,
                size: 72,
                color: Theme.of(context).colorScheme.onPrimary,
              )
          ),

          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text("H O M E"),
            onTap: ()=> Navigator.pushNamed(context, '/'),
          ),

          ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text("S E T T I N G S"),
            onTap: ()=> Navigator.pushNamed(context, '/settings_page'),
          ),
        ],
      ),
    );
  }
}
