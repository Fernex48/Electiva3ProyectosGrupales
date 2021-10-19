// ignore_for_file: deprecated_member_use, camel_case_types

import 'package:flutter/material.dart';
import 'package:medicinasyfarmacias/pantallas/menu.dart';
import 'package:medicinasyfarmacias/pantallas/registro.dart';
import '../funciones/funciones.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
        image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/736x/7d/38/96/7d3896c0fa5bb329fba53caa200224a2.jpg"),
            fit: BoxFit.cover)),
    child: Center(
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          tituloPantalla("Login"),
          const SizedBox(
            height: 15,
          ),
          space(),
          const SizedBox(
            height: 15,
          ),
          const contenedorDat(),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    ),
  );
}

Widget space() {
  // ignore: prefer_const_literals_to_create_immutables
  return Column(children: <Widget>[
    const SizedBox(height: 230),
  ]);
}

class contenedorDat extends StatelessWidget {
  const contenedorDat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFFFFDE7),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 25),
          const Text(
            "Bienvenido",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Ingrese sus credenciales",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                hintText: "Ingrese su Usuario",
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                hintText: "Ingrese su Contraseña",
                suffixIcon: Icon(Icons.visibility),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuApp()));
                  },
                  child: const Text(
                    "Iniciar Sesion",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: "Tahoma",
                    ),
                  )),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "O",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 10),
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Registro()));
            },
            child: const Text(
              "Registrarse",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontFamily: "Tahoma",
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
//El contenedor
/*
Widget contenedorDat2() {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(
      color: Color(0xFFFFFDE7),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    alignment: Alignment.center,
    child: Column(
      children: <Widget>[
        const SizedBox(height: 25),
        const Text(
          "Bienvenido",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Ingrese sus credenciales",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
              ),
              hintText: "Ingrese su Usuario",
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
              ),
              hintText: "Ingrese su Contraseña",
              suffixIcon: Icon(Icons.visibility),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
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
                  "Iniciar Sesion",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: "Tahoma",
                  ),
                )),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "O",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 10),
        FlatButton(
          onPressed: () {},
          child: const Text(
            "Registrarse",
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontFamily: "Tahoma",
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    ),
  );
}*/
