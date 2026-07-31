import 'package:flutter/material.dart';

import '../../widgets/app_drawer.dart';
import '../../widgets/feature_card.dart';
import '../../widgets/status_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      drawer: const AppDrawer(),

      appBar: AppBar(
        title: const Text("Anti-Theft Guardian"),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          const StatusCard(),

          const SizedBox(height: 20),

          FeatureCard(
            icon: Icons.directions_walk,
            title: "Motion Guard",
            subtitle: "Detect movement instantly",
            color: Colors.green,
            onTap: () {},
          ),

          FeatureCard(
            icon: Icons.power,
            title: "Charger Guard",
            subtitle: "Alarm on charger removal",
            color: Colors.blue,
            onTap: () {},
          ),

          FeatureCard(
            icon: Icons.shopping_bag,
            title: "Bag Guard",
            subtitle: "Bag theft protection",
            color: Colors.orange,
            onTap: () {},
          ),

          FeatureCard(
            icon: Icons.checkroom,
            title: "Pocket Guard",
            subtitle: "Pocket protection",
            color: Colors.purple,
            onTap: () {},
          ),

          FeatureCard(
            icon: Icons.headphones,
            title: "Headphone Guard",
            subtitle: "Detect headset removal",
            color: Colors.red,
            onTap: () {},
          ),

          FeatureCard(
            icon: Icons.sim_card,
            title: "SIM Guard",
            subtitle: "Detect SIM change",
            color: Colors.teal,
            onTap: () {},
          ),

          FeatureCard(
            icon: Icons.camera_alt,
            title: "Intruder Selfie",
            subtitle: "Capture unauthorized access",
            color: Colors.indigo,
            onTap: () {},
          ),

          FeatureCard(
            icon: Icons.pan_tool,
            title: "Clap Finder",
            subtitle: "Find phone by clap",
            color: Colors.amber,
            onTap: () {},
          ),

          FeatureCard(
            icon: Icons.mic,
            title: "Whistle Finder",
            subtitle: "Find phone by whistle",
            color: Colors.deepOrange,
            onTap: () {},
          ),

        ],
      ),

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: selectedIndex,

        onTap: (index){

          setState(() {

            selectedIndex=index;

          });

        },

        selectedItemColor: Colors.green,

        type: BottomNavigationBarType.fixed,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.workspace_premium),
            label: "Premium",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),

        ],

      ),

    );

  }
}
