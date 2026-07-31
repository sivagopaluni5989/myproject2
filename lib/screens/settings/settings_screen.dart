import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkMode = false;
  bool notifications = true;
  bool vibration = true;
  bool flashlight = true;

  double volume = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          const Text(
            "General",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          const SizedBox(height: 15),

          Card(
            child: SwitchListTile(
              title: const Text("Dark Mode"),
              subtitle: const Text("Enable dark theme"),
              secondary: const Icon(Icons.dark_mode),
              value: darkMode,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              },
            ),
          ),

          Card(
            child: SwitchListTile(
              title: const Text("Notifications"),
              subtitle: const Text("Enable security notifications"),
              secondary: const Icon(Icons.notifications),
              value: notifications,
              onChanged: (value) {
                setState(() {
                  notifications = value;
                });
              },
            ),
          ),

          Card(
            child: SwitchListTile(
              title: const Text("Vibration"),
              subtitle: const Text("Vibrate during alarm"),
              secondary: const Icon(Icons.vibration),
              value: vibration,
              onChanged: (value) {
                setState(() {
                  vibration = value;
                });
              },
            ),
          ),

          Card(
            child: SwitchListTile(
              title: const Text("Flashlight"),
              subtitle: const Text("Blink flashlight during alarm"),
              secondary: const Icon(Icons.flashlight_on),
              value: flashlight,
              onChanged: (value) {
                setState(() {
                  flashlight = value;
                });
              },
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            "Alarm Volume",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          Slider(
            value: volume,
            min: 0,
            max: 100,
            divisions: 100,
            label: volume.round().toString(),
            onChanged: (value) {
              setState(() {
                volume = value;
              });
            },
          ),

          const SizedBox(height: 25),

          Card(
            child: ListTile(
              leading: const Icon(Icons.music_note),
              title: const Text("Alarm Sound"),
              subtitle: const Text("Police Siren"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.language),
              title: const Text("Language"),
              subtitle: const Text("English"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.lock),
              title: const Text("Permissions"),
              subtitle: const Text("Manage App Permissions"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text("App Version"),
              subtitle: const Text("1.0.0"),
            ),
          ),

          const SizedBox(height: 40),

          SizedBox(
            height: 55,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.save),
              label: const Text(
                "Save Settings",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
