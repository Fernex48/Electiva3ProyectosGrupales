// ignore_for_file: deprecated_member_use, camel_case_types

import 'package:flutter/material.dart';
import 'package:medicinasyfarmacias/pantallas/cat_seleccionada.dart';
import '../funciones/funciones.dart';

class Categorias extends StatefulWidget {
  const Categorias({Key? key}) : super(key: key);

  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpoApp(
          tituloPantalla("Medicamentos"),
          campoBuscar("Buscar producto"),
          contenedorCategoria(),
          const botonRegresar()),
      //bottomNavigationBar: barraFooter(),
    );
  }
}

//El contenedor para todos los botones de las categorías
Widget contenedorCategoria() {
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
          "Categorías",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        SizedBox(height: 20),
        botonCategoria(nombreBoton: 'Gripe, tos y asma'),
        SizedBox(height: 15),
        botonCategoria(nombreBoton: 'Salud visual'),
        SizedBox(height: 15),
        botonCategoria(nombreBoton: 'Primeros auxilios'),
        SizedBox(height: 15),
        botonCategoria(nombreBoton: 'Nutrición y dieta'),
        SizedBox(height: 15),
        botonCategoria(nombreBoton: 'Piel'),
        SizedBox(height: 15),
        botonCategoria(nombreBoton: 'Vitaminas y minerales'),
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

class botonCategoria extends StatelessWidget {
  const botonCategoria({Key? key, required this.nombreBoton}) : super(key: key);
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
                      builder: (context) => const CategoriaSeleccionada()));
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

/*Widget botonCategoria2(String nombreBoton) {
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

// Primer método del botón Regresar
/*Widget botonRegresar2() {
  // ignore: deprecated_member_use
  return FlatButton(
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      onPressed: () {},
      child: Text(
        "Regresar",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontFamily: "Arial",
        ),
      ));
}*/

//Una barra de navegación en la parte inferior que por el momento no se utiliza
/*BottomNavigationBar barraFooter() {
  return BottomNavigationBar(
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.arrow_back_outlined), title: Text("Regresar")),
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Menu")),
    ],
  );
}*/
