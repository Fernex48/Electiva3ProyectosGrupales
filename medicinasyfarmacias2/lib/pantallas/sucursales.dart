// ignore_for_file: deprecated_member_use, camel_case_types

import 'package:flutter/material.dart';
import 'package:medicinasyfarmacias/pantallas/sucursal_seleccionada.dart';
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
      body: cuerpoApp(
          tituloPantalla("Farmacia Seleccionada"),
          campoBuscar("Buscar sucursal"),
          sucursalFarmacia(),
          const botonRegresar()),
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
      children: const <Widget>[
        SizedBox(height: 15),
        Text(
          "Sucursales",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        SizedBox(height: 20),
        botonSucursal(nombreBoton: 'Antiguo'),
        SizedBox(height: 15),
        botonSucursal(nombreBoton: 'Autopista Sur'),
        SizedBox(height: 15),
        botonSucursal(nombreBoton: 'Catedral'),
        SizedBox(height: 15),
        botonSucursal(nombreBoton: 'Constitucion'),
        SizedBox(height: 15),
        botonSucursal(nombreBoton: 'El encuentro'),
        SizedBox(height: 15),
        botonSucursal(nombreBoton: 'Escalon'),
        SizedBox(height: 25),
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

class botonSucursal extends StatelessWidget {
  const botonSucursal({Key? key, required this.nombreBoton}) : super(key: key);
  final String nombreBoton;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: ButtonTheme(
        minWidth: double.infinity,
        height: 45.0,
        child: FlatButton(
            color: Colors.blue[800],
            //padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SucursalSeleccioanda()));
            },
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
}

/*Widget botonSucursal2(String nombreBoton) {
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
}*/

//Método para el botón "Regresar" más actualizado
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
