import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';


void main() {
  runApp(const RandomColors());
}
class RandomColors extends StatefulWidget {
  const RandomColors({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _RandomColors createState() => _RandomColors();
}


class _RandomColors extends State<RandomColors> {
  int points = 0;
  late String randomName;
  late Color randomColor;
  var colorNames = ['azul', 'verde', 'naranja', 'rosa', 'rojo','morado','turquesa' ,'amarillo'];
  var colorHex = [
    const Color(0xFF0000FF),
    const Color(0xFF00FF00),
    const Color(0xFFFF914D),
    const Color(0xFFFF66C4),
    const Color(0xFFFF0000),
    const Color(0xFF291167), // añadido
    const Color(0xFF398982), // añadido
    const Color(0xFFFBC512)
  ];


  @override
  void initState() {
    super.initState();
    getRandomColor();
    getRandomName();
    timer();
  }


  void timer() {
    Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      getRandomColor();
      getRandomName();
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Puntos: $points',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  onGiftTap(randomName, randomColor);
                },
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      color: randomColor,
                      height: 120,
                    ),
                    Text(
                      randomName,
                      style: TextStyle(
                          color: randomColor,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void getRandomColor() {
    Random random = Random();
    if(points>10){
      int randomNumber = random.nextInt(7);
      randomColor = colorHex[randomNumber];
    } if(points>5){
      int randomNumber = random.nextInt(6);
      randomColor = colorHex[randomNumber];
    } if(points<0){
      int randomNumber = random.nextInt(3);
      randomColor = colorHex[randomNumber];
    } else {
      int randomNumber = random.nextInt(5);
      randomColor = colorHex[randomNumber];
    }

  }


  void getRandomName() {
    Random random = Random();
    if(points>10){
      int randomNumber = random.nextInt(7);
      randomName = colorNames[randomNumber];
    }
    if(points>5){
      int randomNumber = random.nextInt(6);
      randomName = colorNames[randomNumber];
    } if(points<0){
      int randomNumber = random.nextInt(3);
      randomName = colorNames[randomNumber];
    } else {
      int randomNumber = random.nextInt(5);
      randomName = colorNames[randomNumber];
    }
  }


  String hexToStringConverter(Color hexColor) {
    if (hexColor == const Color(0xFF0000FF)) {
      return 'azul';
    } else if (hexColor == const Color(0xFF00FF00)) {
      return 'verde';
    } else if (hexColor == const Color(0xFFFF914D)) {
      return 'naranja';
    } else if (hexColor == const Color(0xFFFF66C4)) {
      return 'rosa';
    } else if (hexColor == const Color(0xFFFF0000)) {
      return 'rojo';
    }  else if (hexColor ==const Color(0xFF291167)) {
      return 'morado';
    } else if (hexColor == const Color(0xFF398982)) {
      return 'turquesa';
    } else {
      return 'amarillo';
    }
  }


  void onGiftTap(String name, Color color) {
    var colorToString = hexToStringConverter(color);
    if (name == colorToString) {
      points++;
    } else {
      points--;
    }
    setState(() {});
  }
}
