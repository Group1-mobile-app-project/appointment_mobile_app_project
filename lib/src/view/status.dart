import 'package:barberappointmentapp/src/viewmodel/status_view_model.dart';
import 'package:barberappointmentapp/src/widgets/barber_drawer.dart';
import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final statusViewModel = StatusViewModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Status',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 182, 172),
      ),
      drawer: const BarberDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: Container(
              height: 190,
              width: double.infinity,
              color: Colors.grey,
            ),
          ),
          const Text(
            "Barber 2",
            style: TextStyle(fontSize: 26),
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 40),
              child: Text(
                "Shop is Open",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              ElevatedButton(
                onPressed: () async {
                  await statusViewModel.toggleShopStatus(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 80, 182, 172),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Toggle Shop"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
