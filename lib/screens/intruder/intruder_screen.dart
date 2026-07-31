import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/intruder_provider.dart';


class IntruderScreen extends StatelessWidget {

  const IntruderScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final intruder =
        Provider.of<IntruderProvider>(context);


    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Intruder Guard",
        ),
        centerTitle: true,
      ),


      body: Center(

        child: Column(

          mainAxisAlignment:
              MainAxisAlignment.center,


          children: [


            const Icon(

              Icons.camera_alt,

              size: 90,

              color: Colors.red,

            ),



            const SizedBox(height: 30),



            Text(

              intruder.activated
                  ? "Intruder Mode Active"
                  : "Intruder Mode Ready",

              style: const TextStyle(

                fontSize: 20,

                fontWeight: FontWeight.bold,

              ),

            ),



            const SizedBox(height: 30),



            ElevatedButton(

              onPressed: () async {

                await intruder.activateIntruderMode();

              },


              child: const Text(
                "TEST INTRUDER ALERT",
              ),

            ),



            const SizedBox(height: 20),



            if (intruder.activated)

              ElevatedButton(

                onPressed: () {

                  intruder.resetIntruderMode();

                },


                child: const Text(
                  "RESET",
                ),

              ),


          ],

        ),

      ),

    );

  }

}
