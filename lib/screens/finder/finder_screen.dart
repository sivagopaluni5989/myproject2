import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/finder_provider.dart';


class FinderScreen extends StatelessWidget {

  const FinderScreen({super.key});


  @override
  Widget build(BuildContext context) {


    final finder =
        Provider.of<FinderProvider>(context);



    return Scaffold(

      appBar: AppBar(

        title:
            const Text(
              "Clap / Whistle Finder",
            ),

      ),



      body: Padding(

        padding:
            const EdgeInsets.all(20),



        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.stretch,


          children: [



            const Icon(

              Icons.hearing,

              size:90,

              color:Colors.blue,

            ),



            const SizedBox(height:30),




            DropdownButtonFormField<String>(

              initialValue:
                  finder.mode,


              decoration:
                  const InputDecoration(

                labelText:
                    "Detection Mode",

                border:
                    OutlineInputBorder(),

              ),



              items: const [


                DropdownMenuItem(

                  value:"Clap",

                  child:
                      Text("👏 Clap Finder"),

                ),



                DropdownMenuItem(

                  value:"Whistle",

                  child:
                      Text("🎵 Whistle Finder"),

                ),

              ],



              onChanged:(value){

                if(value != null){

                  finder.setMode(value);

                }

              },


            ),




            const SizedBox(height:30),




            Text(

              finder.enabled

              ? "Finder Active"

              : "Finder Disabled",


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




            ElevatedButton.icon(

              icon:
                  const Icon(Icons.search),


              label:
                  const Text(
                    "START FINDER",
                  ),


              onPressed:

              finder.enabled

              ? null

              : finder.startFinder,


            ),




            const SizedBox(height:15),




            ElevatedButton.icon(

              icon:
                  const Icon(Icons.stop),


              label:
                  const Text(
                    "STOP FINDER",
                  ),


              onPressed:

              finder.enabled

              ? finder.stopFinder

              : null,


            ),



          ],

        ),

      ),

    );

  }

}
