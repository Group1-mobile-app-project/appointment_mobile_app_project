import 'package:barberappointmentapp/src/viewmodel/barber_requests_viewmodel.dart';
import 'package:barberappointmentapp/src/widgets/barber_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Requests extends StatelessWidget {
  const Requests({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<Map<String, dynamic>>> requests =
        BarberRequestViewModel.allrequests;
    final viewModel = Provider.of<BarberRequestViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Requests",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 182, 172),
      ),
      drawer: const BarberDrawer(),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: requests,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // or any loading indicator
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Map<String, dynamic>> requests = snapshot.data ?? [];

            return ListView.builder(
              itemCount: requests.length,
              itemBuilder: (context, index) {
                String id = requests[index]['requestid'];
                Timestamp datetime = requests[index]['DateTime'];
                final DateTime = BarberRequestViewModel.formatDateTime(datetime);
                return ListTile(
                  title: Text(id),
                  subtitle:  Text(DateTime),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => <PopupMenuEntry<String>>[
                      const PopupMenuItem(
                        value: "accept",
                        child: Text("ACCEPT"),
                      ),
                      const PopupMenuItem(
                        value: "cancel",
                        child: Text("CANCEL"),
                      ),
                    ],
                    onSelected: (String value) {
                      if (value == "accept") {
                        viewModel.accept(context);
                      }
                      if (value == "cancel") {
                        viewModel.cancel(context);
                      }
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
