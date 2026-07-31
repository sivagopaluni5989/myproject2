
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/history_service.dart';
import '../../models/security_event_model.dart';
import '../../services/pin_service.dart';
import '../../services/intruder_service.dart';
import '../../providers/motion_provider.dart';


class SecurityStopScreen extends StatefulWidget {

  const SecurityStopScreen({super.key});

  @override
  State<SecurityStopScreen> createState() =>
      _SecurityStopScreenState();

}


class _SecurityStopScreenState
    extends State<SecurityStopScreen> {


  final TextEditingController controller =
      TextEditingController();


  final PinService pinService =
      PinService();


  final IntruderService intruderService =
      IntruderService();

    final HistoryService historyService =
      HistoryService();


  String message = "";

  int failedAttempts = 0;



  Future<void> verifyPin() async {


    final motion =
        Provider.of<MotionProvider>(
          context,
          listen: false,
        );


    final enteredPin =
        controller.text.trim();



    final correct =
        await pinService.verifyPin(
          enteredPin,
        );



    if (!correct) {


      failedAttempts++;


      if (!mounted) return;


      setState(() {

        message =
            "❌ Wrong PIN ($failedAttempts/3)";

      });



      if (failedAttempts >= 3) {


        await intruderService
            .triggerIntruderMode();



        if (!mounted) return;


        setState(() {

          message =
              "🚨 Intruder Mode Activated";

        });

      }


      controller.clear();


      return;

    }


    await historyService.addEvent(
  SecurityEventModel(
    type: "Alarm Stopped",
    time: DateTime.now().toString(),
    message: "Alarm stopped using security PIN",
  ),
);


    await motion.stopProtection();
    
    
    if (!mounted) return;


    Navigator.pop(context);


  }





  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        title:
            const Text(
              "Stop Alarm",
            ),

      ),



      body: Padding(

        padding:
            const EdgeInsets.all(20),



        child: Column(


          mainAxisAlignment:
              MainAxisAlignment.center,



          children: [


            const Icon(

              Icons.warning,

              size:90,

              color:Colors.red,

            ),



            const SizedBox(height:30),



            TextField(

              controller:
                  controller,


              keyboardType:
                  TextInputType.number,


              obscureText:true,


              decoration:
                  const InputDecoration(

                labelText:
                    "Enter Security PIN",

                border:
                    OutlineInputBorder(),

              ),

            ),



            const SizedBox(height:20),



            ElevatedButton(

              onPressed:
                  verifyPin,


              child:
                  const Text(
                    "STOP ALARM",
                  ),

            ),



            const SizedBox(height:20),



            Text(

              message,

              style:
                  const TextStyle(
                    fontSize:18,
                  ),

            ),

          ],

        ),

      ),

    );

  }




  @override
  void dispose() {

    controller.dispose();

    super.dispose();

  }

}
