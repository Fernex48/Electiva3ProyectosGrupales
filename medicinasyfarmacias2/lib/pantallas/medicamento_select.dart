// ignore_for_file: deprecated_member_use, camel_case_types

import 'package:flutter/material.dart';
import 'package:medicinasyfarmacias/database/dbcategorias.dart';

// ignore: must_be_immutable
class MedSeleccionado extends StatefulWidget {
  MedSeleccionado({Key? key, required this.medicina, required this.db})
      : super(key: key);
  Map medicina;
  DatabaseCategorias db;
  @override
  _MedSeleccionadoState createState() => _MedSeleccionadoState();
}

String nombreM = "";
String descripcionM = "";
String imagenM = "";

class _MedSeleccionadoState extends State<MedSeleccionado> {
  @override
  void initState() {
    super.initState();
    nombreM = widget.medicina['nombre'];
    descripcionM = widget.medicina['descrip'];
    imagenM = widget.medicina['imagen'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Centra el título que está contenido dentro del appbar...
        centerTitle: true,
        //color de fondo del appbar
        backgroundColor: const Color(0xAAFA94FD),
        //Texto "Farmacias"
        title: const Text("Medicamento seleccionado"),
      ),
      body: descripcionMedicamento(),
      resizeToAvoidBottomInset: false,
    );
  }
}

Widget descripcionMedicamento() {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(
      color: Color(0xAAD2FEFF),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    alignment: Alignment.topCenter,
    child: Column(
      children: <Widget>[
        const SizedBox(height: 15),
        Text(
          nombreM,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(descripcionM,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15)),
      ],
    ),
  );
}
