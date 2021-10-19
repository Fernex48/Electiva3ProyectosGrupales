// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use, duplicate_ignore, camel_case_types

import 'package:flutter/material.dart';
import '../funciones/funciones.dart';
import 'medicamento_select.dart';

class CategoriaSeleccionada extends StatefulWidget {
  const CategoriaSeleccionada({Key? key}) : super(key: key);

  @override
  _CategoriaSeleccionadaState createState() => _CategoriaSeleccionadaState();
}

class _CategoriaSeleccionadaState extends State<CategoriaSeleccionada> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpoApp(
          tituloPantalla("Categoría seleccionada"),
          campoBuscar("Buscar producto"),
          contenedorMedicina(),
          const botonRegresar()),
      //bottomNavigationBar: barraFooter(),
    );
  }
}

//El contenedor para todos los botones de las categorías
Widget contenedorMedicina() {
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
          "Medicinas",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        SizedBox(height: 15),
        botonMedicina(
            fuente: 'assets/img/med1.jpg',
            medicina: 'ABRILAR JARABE CON MENTOL FRASCO X 200ML'),
        SizedBox(height: 15),
        botonMedicina(
          fuente: 'assets/img/med2.jpg',
          medicina: 'AMBROXOL SUIZOS 15MG/5ML SOLUCION FRASCO 120ML',
        ),
        SizedBox(height: 15),
        botonMedicina(
          fuente: 'assets/img/med3.jpg',
          medicina: 'ANTIFLUDES JARABE INFANTIL FRASCO X 60 ML',
        ),
        SizedBox(height: 15),
        /*botonMedicina("img/med4.jpg",
            "ANTIGRIP COMBINADO AM-PM X 6 SOBRES DE 2 TABLETAS"),
        SizedBox(height: 15),*/
      ],
    ),
  );
}

//Widget para la creación del botón de la categoría, al invocarlo, se debe brindar una cadena
//con el nombre que tendrá el botón. Esto para que no se deba codificar un widget por cada botón.

class botonMedicina extends StatelessWidget {
  const botonMedicina({Key? key, required this.fuente, required this.medicina})
      : super(key: key);
  final String fuente;
  final String medicina;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: ButtonTheme(
        minWidth: double.infinity,
        height: 45.0,
        // ignore: deprecated_member_use
        child: FlatButton(
          color: Colors.white,
          //padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MedSeleccionado()));
          },
          child: Container(
            child: Row(
              children: <Widget>[
                imagenBoton(fuente),
                const SizedBox(width: 15),
                Flexible(
                  child: Text(
                    medicina,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: "Tahoma",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*Widget botonMedicina2(String fuente, String medicina) {
  // ignore: deprecated_member_use
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 25),
    child: ButtonTheme(
      minWidth: double.infinity,
      height: 45.0,
      // ignore: deprecated_member_use
      child: FlatButton(
        color: Colors.white,
        //padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
        onPressed: () {},
        child: Container(
          child: Row(
            children: <Widget>[
              imagenBoton(fuente),
              const SizedBox(width: 15),
              Flexible(
                child: Text(
                  medicina,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "Tahoma",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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

Widget imagenBoton(String url) {
  return Column(
    children: <Widget>[
      Stack(
        children: <Widget>[
          //Container o SizedBox
          SizedBox(
            height: 120,
            width: 120,
            child: Image.asset(url),
          ),
        ],
      ),
    ],
  );
}
