import 'package:flutter/material.dart';

class Customerm extends StatelessWidget {
  const Customerm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          width: 380,
          height: 80,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(12)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Request',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Column(
                children: [
                  Text(
                    'Time : 12:00 Am',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Date : 12/6/2023',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Not approved',
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  )
                ],
              )
            ],
          )),
    );
  }
}
