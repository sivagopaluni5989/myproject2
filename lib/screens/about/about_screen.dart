import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          const SizedBox(height: 20),

          const CircleAvatar(
            radius: 55,
            backgroundColor: Colors.green,
            child: Icon(
              Icons.security,
              size: 55,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          const Center(
            child: Text(
              "Anti-Theft Guardian",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 10),

          const Center(
            child: Text(
              "Version 1.0.0",
            ),
          ),

          const SizedBox(height: 30),

          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Anti-Theft Guardian protects your mobile from theft using smart security features including Motion Guard, Charger Guard, Pocket Guard, SIM Guard and Intruder Selfie.",
                textAlign: TextAlign.justify,
              ),
            ),
          ),

          const SizedBox(height: 25),

          Card(
            child: ListTile(
              leading: const Icon(Icons.email),
              title: const Text("Support"),
              subtitle: const Text("support@antitheftguardian.com"),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.language),
              title: const Text("Website"),
              subtitle: const Text("Coming Soon"),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text("Privacy Policy"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.star),
              title: const Text("Rate App"),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.share),
              title: const Text("Share App"),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}
