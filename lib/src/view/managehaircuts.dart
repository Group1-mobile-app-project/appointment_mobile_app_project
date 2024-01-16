import 'package:barberappointmentapp/src/Firebase/services.dart';
import 'package:barberappointmentapp/src/viewmodel/manage_haircut_viewmodel.dart';
import 'package:barberappointmentapp/src/widgets/barber_drawer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManageHaircuts extends StatelessWidget {
  const ManageHaircuts({Key? key});

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
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: ViewModel.haircutsCollection.snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }

                var haircuts = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: haircuts.length,
                  itemBuilder: (context, index) {
                    var haircut = haircuts[index];

                    return ListTile(
                      title: Text(haircut['name']),
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
                            ViewModel.change(context, haircut['name']);
                          }
                          if (value == "delete") {
                            ViewModel.delete(context, haircut['name']);
                          }
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              ViewModel.pickImageAndUpdateState(ImageSource.gallery);
            },
            child: const Text('Select Haircut'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 58, vertical: 10),
            child: TextFormField(
              onChanged: (value) => ViewModel.setHaircutName(value),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Haircut Name",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (ViewModel.image != null) {
                ViewModel.storeHaircut();
              }
            },
            child: const Text('Upload'),
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
