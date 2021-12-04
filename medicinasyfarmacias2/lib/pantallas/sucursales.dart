// POR AHORA NO HAY QUE HACER CASO A LOS IMPORTS QUE ESTAN COMENTADOS, QUE NO SE BORREN PERO TAMPOCO SE USEN

// ignore_for_file: deprecated_member_use, camel_case_types, avoid_unnecessary_containers
//import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:medicinasyfarmacias/pantallas/sucursales.dart';
//import '../funciones/funciones.dart';
import 'package:flutter/material.dart';
import 'package:medicinasyfarmacias/database/dbfarmacias.dart';
import 'package:medicinasyfarmacias/pantallas/sucursal_seleccionada.dart';

//El Stateful que conocemos, aquí se crea toda la metodología donde se interactúa con la base de datos.
//Se necesita un contexto dentro del método donde se realizar la consulta a la base de datos, por eso fue más
//conveniente hacer las consultas aquí
// ignore: must_be_immutable
class Sucursales extends StatefulWidget {
  Sucursales({Key? key, required this.farmacia, required this.db})
      : super(key: key);
  Map farmacia;
  DatabaseFarmacias db;
  @override
  _SucursalesState createState() => _SucursalesState();
}

String idFarmacia = "";

class _SucursalesState extends State<Sucursales> {
  //Elementos para lograr la conexión con la base de datos, usando el archivo dart "dbFarmacias"
  //el cual tiene una clase llamada "DatabaseFarmacias", la cual contiene las funciones para realizar el CRUD.

  //Objeto de la clase DatabaseFarmacias
  late DatabaseFarmacias db;
  //Listado donde se irán guardando los registros de la colección consultada de la base.
  List docs = [];
  //Inicialización del objeto
  initialise() {
    db = DatabaseFarmacias();
    db.initiliase();
    //Se hace uso de la función para leer todos los datos, se configura el estado internamente para asignar cada valor (registro de la colección)
    //como elementos para la lista "docs"
    //En otras palabras, guarda todos los registros de la colección Farmacias en el listado que luego se usará para mostrarlos en pantalla.
    db.readSucursales(widget.farmacia['id']).then((value) => {
          setState(() {
            docs = value;
          })
        });
  }

  //Se inicia el estado de la conexión...
  @override
  void initState() {
    idFarmacia = widget.farmacia['id'];
    super.initState();
    initialise();
  }

  //El widget principal, este contiene una barra de aplicación "AppBar" que a su vez, contendrá un botón para regresar, el título
  //y una opción de bùsqueda con un ícono...
  //este Widget contiene también el listado de las farmacias...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Color de fondo
      backgroundColor: const Color(0xFF81F4DA),
      //Barra superior
      appBar: AppBar(
        //Centra el título que está contenido dentro del appbar...
        centerTitle: true,
        //color de fondo del appbar
        backgroundColor: const Color(0xAAFA94FD),
        //Texto "Farmacias"
        title: const Text("Sucursales"),
      ),

      //ESTO ES LO IMPORTANTE DEL CÓDIGO, AQUÍ SE MUESTRAN LOS REGISTROS DE LA COLECCIÓN FARMACIAS DIRECTO DE LA BASE DE DATOS

      //Se utiliza un constructor de una vista de listado, dentro de la cual, por medio del context, se crean elementos del mismo formato
      //uno por cada elemento de la colección de la base de datos.
      body: ListView.builder(
        //La cantidad de farmacias
        itemCount: docs.length,
        //El elemento que se creará para cada farmacia, en este caso, un botón azul con text blanco.
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: ButtonTheme(
              minWidth: double.infinity,
              height: 60.0,
              child: FlatButton(
                color: Colors.blue[600],

                //Esta función permite al botón realizar una acción, por ahora NO está definida la acción, así que si ve
                //otras lineas comentadas, no las borre por favor.
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SucursalSeleccioanda(
                              sucursal: docs[index],
                              db: db,
                              idFarmacia: idFarmacia)));
                },
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        docs[index]['nombre'],
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: "Tahoma",
                        ),
                      ),
                      Text(
                        docs[index]['direccion'],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: "Arial",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
