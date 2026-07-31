import 'package:flutter/material.dart';

import '../../services/pin_service.dart';



class SecurityScreen extends StatefulWidget {

  const SecurityScreen({super.key});


  @override
  State<SecurityScreen> createState() => _SecurityScreenState();

}




class _SecurityScreenState extends State<SecurityScreen> {


  final PinService _pinService = PinService();


  final TextEditingController controller =
      TextEditingController();



  Future<void> savePin() async {


    if (controller.text.length < 4) {


      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("PIN must be 4 digits"),
        ),
      );


      return;

    }



    await _pinService.savePin(
      controller.text,
    );



    if (!mounted) return;


    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Security PIN Saved"),
      ),
    );


    controller.clear();

  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Security PIN",
        ),
      ),


      body: Padding(

        padding: const EdgeInsets.all(20),


        child: Column(

          children: [


            TextField(

              controller: controller,

              keyboardType: TextInputType.number,

              obscureText: true,

              maxLength: 6,


              decoration: const InputDecoration(

                labelText: "Enter PIN",

                border: OutlineInputBorder(),

              ),

            ),



            const SizedBox(height:20),



            ElevatedButton(

              onPressed: savePin,

              child: const Text(
                "Save PIN",
              ),

            ),


          ],

        ),

      ),

    );

  }

}

