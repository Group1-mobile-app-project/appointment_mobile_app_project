import 'package:barberappointmentapp/src/viewmodel/status_view_model.dart';
import 'package:barberappointmentapp/src/widgets/barber_drawer.dart';
import 'package:flutter/material.dart';

import '../model/barber_model.dart';

class StatusPage extends StatefulWidget {
  StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  final statusViewModel = StatusViewModel();

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder<Barber>(
        future: statusViewModel.getBarberStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return const Text('No data available');
          } else {
            Barber barber = snapshot.data!;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: Container(
                    height: 190,
                    width: double.infinity,
                    color: Colors.grey,
                    child: barber.imagePath != null || barber.imagePath != ''
                        ? Image.network(barber.imagePath)
                        : Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                  ),
                ),
                Text(
                  barber.name,
                  style: const TextStyle(fontSize: 26),
                ),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 40),
                    child: Text(
                      barber.status ? "Shop is Open" : "Shop is Closed",
                      style: const TextStyle(fontSize: 20),
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
                        backgroundColor:
                            const Color.fromARGB(255, 80, 182, 172),
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
            );
          }
        },
      ),
    );
  }
}
