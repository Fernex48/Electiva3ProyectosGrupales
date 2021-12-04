import 'package:flutter/material.dart';

//Funciones que se utilizan en diferentes pantallas
// se han creado aquí para optimizar el código, ya que se habían repetido.

//Función para mostrar el título de la pantalla respectiva.
Widget tituloPantalla(String cadenaTitulo) {
  return Container(
    height: 65,
    width: double.infinity,
    decoration: const BoxDecoration(
      color: Color(0xAAFA94FD),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
    ),
    alignment: Alignment.center,
    child: Text(
      cadenaTitulo,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    ),
  );
}
