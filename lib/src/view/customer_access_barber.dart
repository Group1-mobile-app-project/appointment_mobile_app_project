// views/barber_account.dart
import 'package:barberappointmentapp/src/view/Haircut_style.dart';
import 'package:flutter/material.dart';
import 'package:barberappointmentapp/src/model/barber_model.dart';
class BarberAccount extends StatelessWidget {
 final Barber barber;
  final String barberId; 

  const BarberAccount({Key? key, required this.barber, required this.barberId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anis BarberShop'),
        backgroundColor: const Color.fromARGB(255, 80, 182, 172),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(100)),
                    child: Image.network(
                        'https://www.thesqcamberley.co.uk/wp-content/uploads/2017/12/anis-logo.jpeg'),
                  ),
                  const Text(
                    "Anis barber Shop",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Text("Phonenumber:2953"),
                  const Text(
                    "Location",
                    style: TextStyle(color: Colors.blue),
                  ),
                  const Row(
                    children: [
                      MyWidget(),
                      SizedBox(width: 20),
                      MyWidget(),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 320,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
              ),
              color: Colors.grey[200],
            ),
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                labelText: 'input appointment time and date',
              ),
              onChanged: (value) {
                print('Input: $value');
              },
            ),
          ),
          Container(
            width: 310,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.black,
              ),
              color: Colors.blue,
            ),
            child: TextButton(
              onPressed: () {
                print('Submit Button Pressed');
              },
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
