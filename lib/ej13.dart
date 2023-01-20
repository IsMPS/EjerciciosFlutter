// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';

import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ejemplo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
          labelStyle: TextStyle(
            color: Colors.blueGrey,
          ),
        ),
      ),
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  int randomNumber = rndm.nextInt(100)+1;
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _textEditingControllers = [];
  final List<Widget> _widgets = [];
  HomeWidget({Key? key}) : super(key: key) {
    List<String> fieldNames = [
      "Número",
    ];
    for (int i = 0; i < fieldNames.length; i++) {
      String fieldName = fieldNames[i];
      TextEditingController textEditingController =
      TextEditingController();
      _textEditingControllers.add(textEditingController);
      _widgets.add(Padding(
        padding: const EdgeInsets.all(7.0),
        child: _createTextFormField(fieldName, textEditingController),
      ));
    }
    _widgets.add(ElevatedButton(
      onPressed: () {
        _formKey.currentState?.validate();
      },
      child: const Text('Validar'),
    ));
  }

  static get rndm => new Random();

  TextFormField _createTextFormField(
      String fieldName, TextEditingController controller) {
    return TextFormField(
        keyboardType: TextInputType.number,
        validator: (var value) {
          if (value!.isEmpty) {
            return 'Por favor, introduzca $fieldName.';
          }
          if (value==randomNumber) {
            return 'Incorrecto el número era ' + randomNumber.toString() + '.';
          }
          return null;
        },
        decoration: InputDecoration(
            icon: const Icon(Icons.adb),
            hintText: fieldName,
            labelText: 'Introduzca $fieldName'),
        controller: controller);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: const Text("Adivina el número"),
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
            child: Form(
                key: _formKey,
                child: ListView(
                  children: _widgets,
                ))));
  }
}
