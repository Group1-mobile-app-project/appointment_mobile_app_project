import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          width: 150,
          height: 150,
          child: Image.network(
              "https://i.pinimg.com/736x/5f/6c/ba/5f6cba4502e7c39e49356fb088a68cfd.jpg"),
        ),
        Text('hair Coloring'),
        Text('Price:10 dollar'),
      ],
    ));
  }
}
