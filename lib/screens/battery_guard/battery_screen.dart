import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/battery_provider.dart';



class BatteryScreen extends StatelessWidget {

  const BatteryScreen({super.key});


  @override
  Widget build(BuildContext context) {


    final battery =
        Provider.of<BatteryProvider>(context);



    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Battery Guard",
        ),

        centerTitle: true,

      ),



      body: Center(

        child: Column(

          mainAxisAlignment:
              MainAxisAlignment.center,


          children: [



            const Icon(

              Icons.battery_alert,

              size: 90,

              color: Colors.red,

            ),



            const SizedBox(height:30),



            Text(

              battery.enabled
                  ? "Battery Protection ON"
                  : "Battery Protection OFF",


              style: const TextStyle(

                fontSize: 20,

                fontWeight: FontWeight.bold,

              ),

            ),



            const SizedBox(height:30),



            ElevatedButton(

              onPressed: () {


                if (battery.enabled) {


                  battery.stopProtection();


                } else {


                  battery.startProtection();


                }


              },


              child: Text(

                battery.enabled
                    ? "STOP GUARD"
                    : "START GUARD",


              ),

            ),



          ],

        ),

      ),

    );

  }

}
