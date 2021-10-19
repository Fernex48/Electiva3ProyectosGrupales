// ignore_for_file: deprecated_member_use, camel_case_types

import 'package:flutter/material.dart';
import '../funciones/funciones.dart';

class Informacion extends StatefulWidget {
  const Informacion({Key? key}) : super(key: key);

  @override
  _InformacionState createState() => _InformacionState();
}

class _InformacionState extends State<Informacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Acerca de"),
      ),
      body: informacionApp(),
    );
  }
}

Widget informacionApp() {
  return Container(
    decoration: const BoxDecoration(
      color: Color(0xAA00F4FF),
    ),
    child: Center(
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          tituloPantalla("Información"), //Titulo de la pantalla
          const SizedBox(
            height: 15,
          ),
          imgDesarrollador(),
          const SizedBox(
            height: 15,
          ),
          acercaDe(),
          const SizedBox(
            height: 10,
          ),
          const botonRegresar(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ),
  );
}

Widget imgDesarrollador() {
  return Column(
    children: <Widget>[Image.asset('assets/img/hombresitoxD.png', width: 200)],
  );
}

//Muestra la informacion de los integrantes del equipo
Widget acercaDe() {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(
      color: Color(0xAAD2FEFF),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    alignment: Alignment.center,
    child: Column(
      children: <Widget>[
        const SizedBox(height: 15),
        const Text(
          "Aplicacion desarrollada por: ",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        const SizedBox(height: 30),
        botonIntegrante("Diego Fernando Bejarano Carias"),
        const SizedBox(height: 25),
        botonIntegrante("Gabriel Omar Chávez Nieto"),
        const SizedBox(height: 25),
        botonIntegrante("Carolina Lisseth Montalvo Villamariona"),
        const SizedBox(height: 25),
        botonIntegrante("Luis Antonio Fredy Romero Cruz"),
        const SizedBox(height: 25),
        botonIntegrante("Gabriela Alejandra Ruiz Quinteros"),
        const SizedBox(height: 35),
      ],
    ),
  );
}

Widget botonIntegrante(String nombreBoton) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 25),
    child: ButtonTheme(
      minWidth: double.infinity,
      height: 45.0,
      child: FlatButton(
          color: Colors.blue[800],
          //padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
          onPressed: () {},
          child: Text(
            nombreBoton,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontFamily: "Tahoma",
            ),
          )),
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

/*Widget botonRegresar2() {
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
            onPressed: () {},
            child: const Text(
              "Regresar",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontFamily: "Verdana",
              ),
            ))),
  );
}*/
