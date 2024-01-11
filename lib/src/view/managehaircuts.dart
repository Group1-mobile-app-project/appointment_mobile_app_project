import 'package:barberappointmentapp/src/viewmodel/manage_haircut_viewmodel.dart';
import 'package:barberappointmentapp/src/widgets/barber_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageHaircuts extends StatelessWidget {
  const ManageHaircuts({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel = Provider.of<ManageHaircutViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Manage Haircut',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 182, 172),
      ),
      drawer: const BarberDrawer(),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Haircut $index"),
            trailing: PopupMenuButton(
              itemBuilder: (context) => <PopupMenuEntry<String>>[
                const PopupMenuItem(
                  value: "change",
                  child: Text("CHANGE"),
                ),
                const PopupMenuItem(
                  value: "delete",
                  child: Text("DELETE"),
                ),
              ],
              onSelected: (String value) {
                if (value == "change") {
                  ViewModel.change(context);
                }
                if (value == "delete") {
                  ViewModel.delete(context);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
