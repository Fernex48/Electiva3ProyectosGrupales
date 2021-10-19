// ignore_for_file: deprecated_member_use, camel_case_types

import 'package:flutter/material.dart';
import '../funciones/funciones.dart';

class SucursalSeleccioanda extends StatefulWidget {
  const SucursalSeleccioanda({Key? key}) : super(key: key);

  @override
  _SucursalSeleccioandaState createState() => _SucursalSeleccioandaState();
}

class _SucursalSeleccioandaState extends State<SucursalSeleccioanda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpoApp2(
        tituloPantalla("Sucursal seleccionada"),
        descripcionSucursal(),
        const botonRegresar(),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

Widget descripcionSucursal() {
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
          "Farmacia San Nicolas Antiguo",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text("Centro Comercial Maquilishuat, local #4 Antiguo Cuscatlan",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15)),
        SizedBox(
          height: 20,
        ),
        Text("Horarios (Abierto)",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 21)),
        SizedBox(
          height: 10,
        ),
        Text("Domingo: 08:30 a. m. - 10:00 p. m",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15)),
        SizedBox(
          height: 10,
        ),
        Text("Lunes: 08:30 a. m. - 10:00 p. m",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15)),
        SizedBox(
          height: 10,
        ),
        Text("Martes: 08:30 a. m. - 10:00 p. m",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15)),
        SizedBox(
          height: 10,
        ),
        Text("Miercoles: 08:30 a. m. - 10:00 p. m",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15)),
        SizedBox(
          height: 10,
        ),
        Text("Jueves: 08:30 a. m. - 10:00 p. m",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15)),
        SizedBox(
          height: 10,
        ),
        Text("Viernes: 08:30 a. m. - 10:00 p. m",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15)),
        SizedBox(
          height: 10,
        ),
        Text("Sabado: 08:30 a. m. - 10:00 p. m",
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
