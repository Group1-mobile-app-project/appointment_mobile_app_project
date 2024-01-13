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
      body: StreamBuilder<QuerySnapshot>(
        stream: viewModel.requests,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<dynamic> request = snapshot.data!.docs.toList();
            return ListView.builder(
              itemCount: request.length,
              itemBuilder: (context, index) {
                String id = request[index]['requestid'];
                Timestamp datetime = request[index]['DateTime'];
                String status = request[index]['status'];
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
