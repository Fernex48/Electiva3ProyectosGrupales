// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../funciones/funciones.dart';

class Sucursales extends StatefulWidget {
  const Sucursales({Key? key}) : super(key: key);

  @override
  _SucursalesState createState() => _SucursalesState();
}

class _SucursalesState extends State<Sucursales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpoApp(tituloPantalla("Farmacia Seleccionada"),
          campoBuscar("Buscar sucursal"), sucursalFarmacia(), botonRegresar()),
      //bottomNavigationBar: barraFooter(),
    );
  }
}

//El contenedor para todos los botones de las categorías
Widget sucursalFarmacia() {
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
          "Sucursales",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        const SizedBox(height: 20),
        botonSucursal("Antiguo"),
        const SizedBox(height: 15),
        botonSucursal("Autopista Sur"),
        const SizedBox(height: 15),
        botonSucursal("Catedral"),
        const SizedBox(height: 15),
        botonSucursal("Constitucion"),
        const SizedBox(height: 15),
        botonSucursal("El encuentro"),
        const SizedBox(height: 15),
        botonSucursal("Escalon"),
        const SizedBox(height: 25),
        //Intento de hacer un listview que NO utilice toda la pantalla.
        /*Container(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              
            ],
          ),
        ),*/
      ],
    ),
  );
}

//Widget para la creación del botón de la categoría, al invocarlo, se debe brindar una cadena
//con el nombre que tendrá el botón. Esto para que no se deba codificar un widget por cada botón.

Widget botonSucursal(String nombreBoton) {
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

//Método para el botón "Regresar" más actualizado
Widget botonRegresar() {
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
              fontFamily: "Tahoma",
            ),
          )),
    ),
  );
}
