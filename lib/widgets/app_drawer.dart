import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            accountName: Text(
              "Anti-Theft Guardian",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              "Protect Your Device",
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.security,
                color: Colors.green,
                size: 40,
              ),
            ),
          ),

          ListTile(
  leading: const Icon(Icons.home),
  title: const Text("Home"),
  onTap: () {
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, AppRoutes.home);
  },
),

          ListTile(
  leading: const Icon(Icons.history),
  title: const Text("History"),
  onTap: () {
    Navigator.pop(context);
    Navigator.pushNamed(context, AppRoutes.history);
  },
),

          ListTile(
  leading: const Icon(Icons.workspace_premium),
  title: const Text("Premium"),
  onTap: () {
    Navigator.pop(context);
    Navigator.pushNamed(context, AppRoutes.premium);
  },
),

          ListTile(
  leading: const Icon(Icons.settings),
  title: const Text("Settings"),
  onTap: () {
    Navigator.pop(context);
    Navigator.pushNamed(context, AppRoutes.settings);
  },
),

          const Divider(),

          ListTile(
  leading: const Icon(Icons.info_outline),
  title: const Text("About"),
  onTap: () {
    Navigator.pop(context);
    Navigator.pushNamed(context, AppRoutes.about);
  },
),
          ListTile(
            leading: const Icon(Icons.star_rate),
            title: const Text("Rate App"),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.share),
            title: const Text("Share App"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
