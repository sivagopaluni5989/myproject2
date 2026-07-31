import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/charger_provider.dart';


class ChargerScreen extends StatefulWidget {

  const ChargerScreen({super.key});


  @override
  State<ChargerScreen> createState() =>
      _ChargerScreenState();

}



class _ChargerScreenState
    extends State<ChargerScreen> {


  final List<String> alarms = [

    "Police Siren",
    "Ambulance",
    "Fire Alarm",
    "Emergency",
    "Loud Horn",

  ];



  @override
  Widget build(BuildContext context) {


    final charger =
        Provider.of<ChargerProvider>(context);



    charger.setContext(context);



    return Scaffold(

      appBar: AppBar(

        title:
            const Text(
              "Charger Guard",
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

              Icons.power,

              size:90,

              color:Colors.green,

            ),



            const SizedBox(height:30),




            Text(

              charger.enabled

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
      charger.selectedAlarm,


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

                  charger.setAlarm(value);

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

              charger.enabled

              ? null

              : charger.startProtection,


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

              charger.enabled

              ? charger.stopProtection

              : null,


            ),


          ],

        ),

      ),

    );


  }


}
