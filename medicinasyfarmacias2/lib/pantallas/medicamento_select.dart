// ignore_for_file: deprecated_member_use, camel_case_types

import 'package:flutter/material.dart';
import '../funciones/funciones.dart';

class MedSeleccionado extends StatefulWidget {
  const MedSeleccionado({Key? key}) : super(key: key);

  @override
  _MedSeleccionadoState createState() => _MedSeleccionadoState();
}

class _MedSeleccionadoState extends State<MedSeleccionado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpoApp2(tituloPantalla("Medicamento seleccionado"),
          descripcionMedicamento(), const botonRegresar()),
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
      children: const <Widget>[
        SizedBox(height: 15),
        Text(
          "ABRILAR JARABE FRASCO X 200 ML",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
            "Extracto de Hedera hélix, cuyo principal principio es Alfa hederina que posee multiple accion terapéutica: mucolítico, expectorante, bronco espasmolítico y antitusígeno. Esta múltiple acción terapéutica explica su eficacia en el tratamiento de las afecciones respiratorias altas y bajas",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15)),
        SizedBox(
          height: 10,
        ),
        Image(
            image: NetworkImage(
                'https://static.wixstatic.com/media/6b7422_9b9a5189cb7d4a40955ccb31cb7fe3f8~mv2.png/v1/fill/w_400,h_400,al_c,lg_1,q_85/Abrilar%20OK.webp')),
        SizedBox(
          height: 10,
        ),
        Text("Precio: \$19.57",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15))
      ],
    ),
  );
}

class botonRegresar extends StatelessWidget {
  const botonRegresar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 100),
      child: ButtonTheme(
          minWidth: double.infinity,
          height: 45.0,
          child: FlatButton(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              //padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Regresar",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontFamily: "Verdana",
                ),
              ))),
    );
  }
}
