// ignore_for_file: deprecated_member_use, camel_case_types

import 'package:flutter/material.dart';
import 'package:medicinasyfarmacias/database/dbusuarios.dart';
import '../funciones/funciones.dart';

class Registro extends StatelessWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: cuerpoP(),
    );
  }
}

late DatabaseUsuarios db;

class cuerpoP extends StatefulWidget {
  const cuerpoP({Key? key}) : super(key: key);

  @override
  State<cuerpoP> createState() => _cuerpoPState();
}

class _cuerpoPState extends State<cuerpoP> {
  List docs = [];
  initialise() {
    db = DatabaseUsuarios();
    db.initiliase();
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

  @override
  Widget build(BuildContext context) {
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
            const contenedorDat(),
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

final _fromKey = GlobalKey<FormState>();
final nombreController = TextEditingController();
final apellidoController = TextEditingController();
final usuarioController = TextEditingController();
final correoController = TextEditingController();
final contraseniaController = TextEditingController();

class contenedorDat extends StatelessWidget {
  const contenedorDat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: Form(
        key: _fromKey,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 15),

            // Nombre
            TextFormField(
              controller: nombreController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Debe colocar un nombre";
                }
                return null;
              },
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Nombre",
              ),
            ),
            const SizedBox(height: 15),

            // Apellido
            TextFormField(
              controller: apellidoController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Debe colocar un apellido";
                }
                return null;
              },
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Apellido",
              ),
            ),
            const SizedBox(height: 15),

            // Usuario
            TextFormField(
              controller: usuarioController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Debe colocar un usuario";
                }
                return null;
              },
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Usuario",
              ),
            ),
            const SizedBox(height: 15),

            // Correo electrónico
            TextFormField(
              controller: correoController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Debe colocar un correo";
                }
                return null;
              },
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Correo electrónico",
              ),
            ),
            const SizedBox(height: 15),
            // Contraseña
            TextFormField(
              obscureText: true,
              controller: contraseniaController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Debe colocar una contraseña";
                }
                return null;
              },
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Contraseña",
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
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
              if (_fromKey.currentState!.validate()) {
                db.create(
                  nombreController.text,
                  apellidoController.text,
                  usuarioController.text,
                  correoController.text,
                  contraseniaController.text,
                );
                Navigator.pop(context, true);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const Dialogo("Usuario registrado exitosamente");
                    });
              }
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

class Dialogo extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final title;
  // ignore: use_key_in_widget_constructors
  const Dialogo(this.title);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Aviso"),
      content: Text(title),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"))
      ],
    );
  }
}

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
