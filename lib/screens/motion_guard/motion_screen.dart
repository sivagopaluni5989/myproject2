import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/motion_provider.dart';

class MotionScreen extends StatefulWidget {
  const MotionScreen({super.key});

  @override
  State<MotionScreen> createState() => _MotionScreenState();
}

class _MotionScreenState extends State<MotionScreen> {
  

  final List<String> alarms = [
    "Police Siren",
    "Ambulance",
    "Fire Alarm",
    "Emergency",
    "Loud Horn",
  ];

  @override
  Widget build(BuildContext context) {
    final motionProvider =
    Provider.of<MotionProvider>(context);


motionProvider.setContext(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Motion Guard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const Icon(
              Icons.vibration,
              size: 90,
              color: Colors.green,
            ),

            const SizedBox(height: 20),

            Text(
              motionProvider.isProtectionEnabled
                  ? "Protection Active"
                  : "Protection Disabled",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: motionProvider.isProtectionEnabled
                    ? Colors.green
                    : Colors.red,
              ),
            ),

            const SizedBox(height: 30),

            DropdownButtonFormField<String>(
              initialValue: motionProvider.selectedAlarm,
              decoration: const InputDecoration(
                labelText: "Alarm Sound",
                border: OutlineInputBorder(),
              ),
              items: alarms.map((alarm) {
                return DropdownMenuItem(
                  value: alarm,
                  child: Text(alarm),
                );
              }).toList(),
              onChanged: (value) {
                motionProvider.setAlarm(value!);
              },
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              icon: const Icon(Icons.play_arrow),
              label: const Text("Start Protection"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
              ),
              onPressed: motionProvider.isProtectionEnabled
                  ? null
                  : () async {
                      await motionProvider.startProtection();
                    },
            ),

            const SizedBox(height: 15),

            ElevatedButton.icon(
              icon: const Icon(Icons.stop),
              label: const Text("Stop Protection"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 55),
              ),
              onPressed: motionProvider.isProtectionEnabled
                  ? () async {
                      await motionProvider.stopProtection();
                    }
                  : null,
            ),

            const SizedBox(height: 30),

            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "When Motion Guard is enabled, moving the phone will trigger the selected alarm.",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
