import 'package:barberappointmentapp/src/viewmodel/haircut_viewmodel.dart';
import 'package:barberappointmentapp/src/widgets/barber_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHaircuts extends StatelessWidget {
  const MyHaircuts({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HaircutViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Haircuts",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 182, 172),
      ),
      drawer: const BarberDrawer(),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: viewModel.allHaircuts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Map<String, dynamic>> haircuts = snapshot.data ?? [];

            return GridView.builder(
              itemCount: haircuts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                String name = haircuts[index]['name'] ?? '';
                String imagePath = haircuts[index]['imagePath'] ?? '';

                return GridTile(
                  footer: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Center(
                      child: Text(
                        name,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: imagePath != null
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              imagePath,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Icon(Icons.person),
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
