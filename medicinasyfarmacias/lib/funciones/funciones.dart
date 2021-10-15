import 'package:flutter/material.dart';

//Funciones que se utilizan en diferentes pantallas
// se han creado aquí para optimizar el código, ya que se habían repetido.

//Función para el cuerpo de la pantalla, se invoca junto con 4 widgets para el contenido.
//Hay algunas pantallas que tienen SU PROPIO método privado de cuerpoApp, por ejemplo,
//que usan 3 widgets en lugar de 4, por ello este método NO se usa en TODAS las pantallas,
//pero si en la mayoría.
Widget cuerpoApp(Widget wid1, Widget wid2, Widget wid3, Widget wid4) {
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
          wid1,
          const SizedBox(
            height: 15,
          ),
          wid2,
          const SizedBox(
            height: 15,
          ),
          wid3,
          const SizedBox(
            height: 25,
          ),
          wid4,
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    ),
  );
}

//Funcion CUERPOAPP EXCLUSIVA para las pantallas de "MedicamentoSeleccionado" y "SucursalSeleccionada"
Widget cuerpoApp2(Widget wid1, Widget wid2, Widget wid3) {
  return Container(
    child: Center(
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          wid1,
          const SizedBox(
            height: 20,
          ),
          wid2,
          const SizedBox(
            height: 20,
          ),
          wid3,
        ],
      ),
    ),
    decoration: BoxDecoration(color: Colors.lightBlue[200]),
  );
}

//Función para mostrar el título de la pantalla respectiva.
Widget tituloPantalla(String cadenaTitulo) {
  return Container(
    height: 55,
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

//Funcion para el campo de busqueda
Widget campoBuscar(String cadenaPista) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
    child: TextField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          prefixIcon: const Icon(Icons.search),
          hintText: cadenaPista,
          fillColor: Colors.white,
          filled: true),
    ),
  );
}
