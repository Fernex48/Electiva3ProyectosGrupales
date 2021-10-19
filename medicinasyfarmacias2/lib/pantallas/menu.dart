// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../funciones/funciones.dart';
import '../pantallas/farmacias.dart';
import '../pantallas/categorias.dart';
import '../pantallas/informacion.dart';
import '../pantallas/login.dart';

class MenuApp extends StatefulWidget {
  const MenuApp({Key? key}) : super(key: key);

  @override
  _MenuAppState createState() => _MenuAppState();
}

class _MenuAppState extends State<MenuApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menú"),
      ),
      body: cuerpoMenu(),
    );
  }
}

Widget cuerpoMenu() {
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
          tituloPantalla("MENÚ"), //Titulo de la pantalla
          const SizedBox(
            height: 25,
          ),
          opcionesMenu(),
          const SizedBox(
            height: 40,
          ),
          const botonCerrarSesion(),
          const SizedBox(
            height: 30,
          ),
          const botonCerrarApp(),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    ),
  );
}

//Opciones de Menú
Widget opcionesMenu() {
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
        const SizedBox(height: 20),
        Column(
          children: <Widget>[
            Image.asset('assets/img/farmacias.png', width: 100)
          ],
        ),
        const SizedBox(height: 10),
        const botonOpciones(nombreBoton: 'Farmacias'),
        const SizedBox(height: 15),
        Column(
          children: <Widget>[
            Image.asset('assets/img/medicamentos.png', width: 100)
          ],
        ),
        const SizedBox(height: 10),
        const botonOpciones(nombreBoton: 'Medicamentos'),
        const SizedBox(height: 15),
        Column(
          children: <Widget>[
            Image.asset('assets/img/informacion.jpg', width: 100)
          ],
        ),
        const SizedBox(height: 10),
        const botonOpciones(nombreBoton: 'Información'),
        const SizedBox(height: 30),
      ],
    ),
  );
}

class botonOpciones extends StatelessWidget {
  const botonOpciones({Key? key, required this.nombreBoton}) : super(key: key);

  final String nombreBoton;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: ButtonTheme(
        minWidth: double.infinity,
        height: 45.0,
        // ignore: deprecated_member_use
        child: FlatButton(
            color: const Color(0xAAD2FEFF),
            //padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
            onPressed: () {
              if (nombreBoton == "Farmacias") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Farmacias()));
              } else if (nombreBoton == "Medicamentos") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Categorias()));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Informacion()));
              }
            },
            child: Text(
              nombreBoton,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontFamily: "Tahoma",
              ),
            )),
      ),
    );
  }
}

/*Widget botonOpciones2(String nombreBoton) {
  // ignore: deprecated_member_use
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 25),
    child: ButtonTheme(
      minWidth: double.infinity,
      height: 45.0,
      // ignore: deprecated_member_use
      child: FlatButton(
          color: const Color(0xAAD2FEFF),
          //padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
          onPressed: () {},
          child: Text(
            nombreBoton,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontFamily: "Tahoma",
            ),
          )),
    ),
  );
}*/

class botonCerrarSesion extends StatelessWidget {
  const botonCerrarSesion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 100),
      child: ButtonTheme(
        minWidth: double.infinity,
        height: 45.0,
        // ignore: deprecated_member_use
        child: FlatButton(
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            //padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            child: const Text(
              "Cerrar sesión",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontFamily: "Tahoma",
              ),
            )),
      ),
    );
  }
}

/*Widget botonCerrarSesion2() {
  // ignore: deprecated_member_use
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 100),
    child: ButtonTheme(
      minWidth: double.infinity,
      height: 45.0,
      // ignore: deprecated_member_use
      child: FlatButton(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          //padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
          onPressed: () {},
          child: const Text(
            "Cerrar sesión",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontFamily: "Tahoma",
            ),
          )),
    ),
  );
}*/

class botonCerrarApp extends StatelessWidget {
  const botonCerrarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 100),
      child: ButtonTheme(
        minWidth: double.infinity,
        height: 45.0,
        // ignore: deprecated_member_use
        child: FlatButton(
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            //padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
            onPressed: () {
              SystemNavigator.pop();
            },
            child: const Text(
              "Cerrar app",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontFamily: "Tahoma",
              ),
            )),
      ),
    );
  }
}

/*Widget botonCerrarApp2() {
  // ignore: deprecated_member_use
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 100),
    child: ButtonTheme(
      minWidth: double.infinity,
      height: 45.0,
      // ignore: deprecated_member_use
      child: FlatButton(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          //padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
          onPressed: () {SystemNavigator.pop()},
          child: const Text(
            "Cerrar app",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontFamily: "Tahoma",
            ),
          )),
    ),
  );
}*/
