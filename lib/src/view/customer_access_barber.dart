import 'package:barberappointmentapp/src/Model/barber_model.dart';
import 'package:flutter/material.dart';

class BarberAccount extends StatelessWidget {
  final Barber barber;

  const BarberAccount({Key? key, required this.barber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barber Shop'),
        backgroundColor: const Color.fromARGB(255, 80, 182, 172),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(barber.imagePath),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            barber.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Phone Number: 0000121",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Location",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(barber.imagePath),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Name ${index + 1}',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 24),
         
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Please Write the time to make an appointment',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 80, 182, 172),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: const Size(360, 60)),
              child: const Text(
                "Submit",
                style: TextStyle(fontSize: 22),
              ),
            ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
