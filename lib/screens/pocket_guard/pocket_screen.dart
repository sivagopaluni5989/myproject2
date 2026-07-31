import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/pocket_provider.dart';


class PocketScreen extends StatelessWidget {

  const PocketScreen({super.key});


  final List<String> alarms = const [

    "Police Siren",
    "Ambulance",
    "Fire Alarm",
    "Emergency",
    "Loud Horn",

  ];


  @override
  Widget build(BuildContext context) {


    final pocket =
        Provider.of<PocketProvider>(context);



    pocket.setContext(context);



    return Scaffold(

      appBar: AppBar(

        title:
            const Text(
              "Pocket Guard",
            ),

      ),



      body:

      Padding(

        padding:
            const EdgeInsets.all(20),


        child:

        Column(

          crossAxisAlignment:
              CrossAxisAlignment.stretch,


          children: [


            const Icon(

              Icons.phone_android,

              size:90,

              color:Colors.green,

            ),



            const SizedBox(height:30),



            Text(

              pocket.enabled

              ? "Protection Active"

              : "Protection Disabled",


              textAlign:
                  TextAlign.center,


              style:
                  const TextStyle(

                    fontSize:22,

                    fontWeight:
                        FontWeight.bold,

                  ),

            ),



            const SizedBox(height:30),



            DropdownButtonFormField<String>(

              initialValue:
                  pocket.selectedAlarm,


              decoration:
                  const InputDecoration(

                    labelText:
                        "Alarm Sound",

                    border:
                        OutlineInputBorder(),

                  ),



              items:

              alarms.map((alarm){

                return DropdownMenuItem(

                  value:
                      alarm,

                  child:
                      Text(alarm),

                );

              }).toList(),



              onChanged:(value){

                if(value != null){

                  pocket.setAlarm(value);

                }

              },


            ),




            const SizedBox(height:30),



            ElevatedButton.icon(

              icon:
                  const Icon(
                    Icons.play_arrow,
                  ),


              label:
                  const Text(
                    "START PROTECTION",
                  ),


              onPressed:

              pocket.enabled

              ? null

              : pocket.startProtection,


            ),





            const SizedBox(height:15),



            ElevatedButton.icon(

              icon:
                  const Icon(
                    Icons.stop,
                  ),


              label:
                  const Text(
                    "STOP PROTECTION",
                  ),


              onPressed:

              pocket.enabled

              ? pocket.stopProtection

              : null,


            ),


          ],


        ),


      ),


    );

  }

}
