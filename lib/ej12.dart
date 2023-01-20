import 'package:flutter/material.dart';

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
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _textEditingControllers = [];
  final List<Widget> _widgets = [];
  HomeWidget({Key? key}) : super(key: key) {
    List<String> fieldNames = [
      "Nombre",
      "Contraseña",
    ];
    for (int i = 0; i < fieldNames.length; i++) {
      String fieldName = fieldNames[i];
      TextEditingController textEditingController =
      TextEditingController(text: "");
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
      child: const Text('Guardar'),
    ));
  }
  TextFormField _createTextFormField(
      String fieldName, TextEditingController controller) {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor, introduzca $fieldName.';
          }
          if (value.length<10) {
            return 'Por favor, introduzca más de 10 caracteres.';
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
          title: const Text("Formulario de contraseña"),
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
