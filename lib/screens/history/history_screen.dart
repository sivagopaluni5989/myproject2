import 'package:flutter/material.dart';

import '../../models/security_event_model.dart';
import '../../services/history_service.dart';


class HistoryScreen extends StatefulWidget {

  const HistoryScreen({super.key});


  @override
  State<HistoryScreen> createState() =>
      _HistoryScreenState();

}



class _HistoryScreenState
    extends State<HistoryScreen> {


  final HistoryService historyService =
      HistoryService();


  List<SecurityEventModel> events = [];


  bool loading = true;



  @override
  void initState() {

    super.initState();

    loadHistory();

  }



  Future<void> loadHistory() async {

    final data =
        await historyService.getHistory();


    if (!mounted) return;


    setState(() {

      events = data.reversed.toList();

      loading = false;

    });

  }




  Future<void> clearHistory() async {


    final confirm =
        await showDialog<bool>(

          context: context,

          builder: (context) {

            return AlertDialog(

              title:
                  const Text(
                    "Clear History?",
                  ),


              content:
                  const Text(
                    "Delete all security events?",
                  ),


              actions: [


                TextButton(

                  onPressed:
                      () => Navigator.pop(
                        context,
                        false,
                      ),

                  child:
                      const Text(
                        "Cancel",
                      ),

                ),



                TextButton(

                  onPressed:
                      () => Navigator.pop(
                        context,
                        true,
                      ),

                  child:
                      const Text(
                        "Delete",
                      ),

                ),

              ],

            );

          },

        );



    if (confirm != true) return;



    await historyService.clearHistory();



    loadHistory();


  }




  IconData getIcon(String type) {


    switch(type) {

      case "Motion":
        return Icons.vibration;


      case "Wrong PIN":
        return Icons.lock;


      case "Alarm Stopped":
        return Icons.check_circle;


      case "Intruder":
        return Icons.warning;


      default:
        return Icons.security;

    }

  }





  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        title:
            const Text(
              "Alarm History",
            ),


        centerTitle: true,


        actions: [


          IconButton(

            icon:
                const Icon(
                  Icons.delete_forever,
                ),


            onPressed:
                clearHistory,

          ),

        ],

      ),



      body:

      loading

          ?

      const Center(

        child:
            CircularProgressIndicator(),

      )


          :

      events.isEmpty

          ?

      const Center(

        child:
            Text(
              "No security events",
              style:
                  TextStyle(
                    fontSize:18,
                  ),
            ),

      )


          :

      ListView.builder(

        padding:
            const EdgeInsets.all(16),


        itemCount:
            events.length,


        itemBuilder:
            (context,index) {


          final event =
              events[index];


          return Card(

            margin:
                const EdgeInsets.only(
                  bottom:12,
                ),


            child: ListTile(

              leading:
                  CircleAvatar(

                    child:
                        Icon(
                          getIcon(
                            event.type,
                          ),
                        ),

                  ),


              title:
                  Text(
                    event.type,
                  ),


              subtitle:
                  Text(
                    "${event.message}\n${event.time}",
                  ),

              isThreeLine:
                  true,

            ),

          );


        },

      ),

    );

  }

}

