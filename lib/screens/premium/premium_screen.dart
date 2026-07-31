import 'package:flutter/material.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  Widget feature(
      IconData icon,
      String title,
      String subtitle,
      Color color,
      ) {

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.lock,
          color: Colors.orange,
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Premium Features"),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [

          const SizedBox(height: 10),

          const Icon(
            Icons.workspace_premium,
            size: 90,
            color: Colors.amber,
          ),

          const SizedBox(height: 15),

          const Center(
            child: Text(
              "Upgrade to Premium",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 10),

          const Center(
            child: Text(
              "Unlock all Anti-Theft Guardian features",
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 25),

          feature(
            Icons.sim_card,
            "SIM Change Detection",
            "Detect SIM replacement instantly",
            Colors.teal,
          ),

          feature(
            Icons.camera_alt,
            "Intruder Selfie",
            "Capture intruder photo",
            Colors.indigo,
          ),

          feature(
            Icons.record_voice_over,
            "Voice Warning",
            "Speak warning message",
            Colors.deepOrange,
          ),

          feature(
            Icons.pan_tool,
            "Clap Finder",
            "Locate phone by clap",
            Colors.green,
          ),

          feature(
            Icons.mic,
            "Whistle Finder",
            "Locate phone by whistle",
            Colors.blue,
          ),

          feature(
            Icons.ads_click,
            "Ad-Free Experience",
            "Remove advertisements",
            Colors.purple,
          ),

          const SizedBox(height: 25),

          SizedBox(
            height: 55,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.workspace_premium),
              label: const Text(
                "Upgrade Now",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onPressed: () {},
            ),
          ),

          const SizedBox(height: 20),

        ],

      ),

    );

  }

}
