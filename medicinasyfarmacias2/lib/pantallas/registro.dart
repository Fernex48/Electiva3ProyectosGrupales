// ignore_for_file: deprecated_member_use, camel_case_types

import 'package:flutter/material.dart';
import 'package:medicinasyfarmacias/pantallas/menu.dart';
import '../funciones/funciones.dart';

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpoP(),
    );
  }
}

Widget cuerpoP() {
  return Container(
    decoration: const BoxDecoration(
      color: Color(0xFF90CAF9),
    ),
    child: Center(
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          tituloPantalla("Registro"),
          const SizedBox(
            height: 15,
          ),
          campoIcono(),
          const SizedBox(
            height: 15,
          ),
          campoDatos(),
          const SizedBox(
            height: 15,
          ),
          contenedorDat(),
          const SizedBox(
            height: 25,
          ),
          const botonRegistrarse(),
          const SizedBox(
            height: 20,
          ),
          const botonCancelar(),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    ),
  );
}

//campo del icono
Widget campoIcono() {
  return const Icon(
    Icons.account_circle,
    size: 100,
  );
}

//Campo de texto
Widget campoDatos() {
  return const Text(
    "Ingrese sus datos",
    textAlign: TextAlign.center,
    style: TextStyle(
        color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
  );
}

//El contenedor
Widget contenedorDat() {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(
      color: Color(0xFFE1F5FE),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    alignment: Alignment.center,
    child: Column(
      children: <Widget>[
        const SizedBox(height: 15),
        campfield("Nombre"),
        const SizedBox(height: 15),
        campfield("Correo Electronico"),
        const SizedBox(height: 15),
        campfield("Nombre de Usuario"),
        const SizedBox(height: 15),
        campfield("Contraseña"),
        const SizedBox(height: 15),
        campfield("Confirme Contraseña"),
        const SizedBox(height: 25),
      ],
    ),
  );
}

Widget campfield(String nombreText) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 25),
    child: TextField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: nombreText,
      ),
    ),
  );
}

class botonRegistrarse extends StatelessWidget {
  const botonRegistrarse({Key? key}) : super(key: key);

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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MenuApp()));
            },
            child: const Text(
              "Registrarse",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: "Tahoma",
              ),
            )),
      ),
    );
  }
}

//Método para el botón Registrarse
/*Widget botonRegistrarse2() {
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
            "Registrarse",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: "Tahoma",
            ),
          )),
    ),
  );
}*/

class botonCancelar extends StatelessWidget {
  const botonCancelar({Key? key}) : super(key: key);

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
              "Cancelar",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: "Tahoma",
              ),
            )),
      ),
    );
  }
}

//Método para el botón Cancelar
/*Widget botonCancelar2() {
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
            "Cancelar",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: "Tahoma",
            ),
          )),
    ),
  );
}*/
