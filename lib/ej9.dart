import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    debugShowCheckedModeBanner: false,
    home: ej9(),
  ));
}

class ej9 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton.icon(
            label: const Text('Elevated Button with icon'),
            icon: const Icon(Icons.access_alarms),
            onPressed: () {},
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.redAccent,
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {},
            child: const Text('Text Button'),
          ),
        ),
        Container(
            padding: const EdgeInsets.all(10),
            child: OutlinedButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.lightBlueAccent,
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('OutlinedButton'),
              onPressed: () {},
            )),
        Container(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              tooltip: 'Icon',
              icon: const Icon(Icons.add_business_sharp),
              iconSize: 75,
              color: Colors.lightBlueAccent,
              onPressed: () {},
            )),
        Container(
            padding: const EdgeInsets.all(10),
            child: const Align(child: CloseButton())),
        Container(
            padding: const EdgeInsets.all(10),
            child: const Align(child: BackButton())),
      ],
    ));
  }
}
