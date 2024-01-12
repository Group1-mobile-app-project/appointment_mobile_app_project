// ignore_for_file: non_constant_identifier_names

import 'package:barberappointmentapp/src/viewmodel/barber_requests_viewmodel.dart';
import 'package:barberappointmentapp/src/widgets/barber_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Firebase/services.dart';

class Requests extends StatelessWidget {
  const Requests({super.key});

  @override
  Widget build(BuildContext context) {
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
        future: viewModel.allrequests,
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
                String status = requests[index]['status'];
                final DateTime = viewModel.formatDateTime(datetime);
                return ListTile(
                  title: Text(id),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(DateTime), Text(status)],
                  ),
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
                        viewModel.accept(context,
                            Firebase.auth.currentUser!.uid, id, "Accepted");
                      }
                      if (value == "cancel") {
                        viewModel.cancel(context,
                            Firebase.auth.currentUser!.uid, id, "Cancelled");
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
