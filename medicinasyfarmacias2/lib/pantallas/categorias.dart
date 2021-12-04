// POR AHORA NO HAY QUE HACER CASO A LOS IMPORTS QUE ESTAN COMENTADOS, QUE NO SE BORREN PERO TAMPOCO SE USEN

// ignore_for_file: deprecated_member_use, camel_case_types
//import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:medicinasyfarmacias/pantallas/sucursales.dart';
//import '../funciones/funciones.dart';
import 'package:flutter/material.dart';
import 'package:medicinasyfarmacias/database/dbcategorias.dart';
import 'package:medicinasyfarmacias/pantallas/cat_seleccionada.dart';

//El Stateful que conocemos, aquí se crea toda la metodología donde se interactúa con la base de datos.
//Se necesita un contexto dentro del método donde se realizar la consulta a la base de datos, por eso fue más
//conveniente hacer las consultas aquí
class Categorias extends StatefulWidget {
  const Categorias({Key? key}) : super(key: key);

  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  //Elementos para lograr la conexión con la base de datos, usando el archivo dart "dbFarmacias"
  //el cual tiene una clase llamada "DatabaseFarmacias", la cual contiene las funciones para realizar el CRUD.

  //Objeto de la clase DatabaseFarmacias
  late DatabaseCategorias db;
  //Listado donde se irán guardando los registros de la colección consultada de la base.
  List docs = [];
  //Inicialización del objeto
  initialise() {
    db = DatabaseCategorias();
    db.initiliase();
    //Se hace uso de la función para leer todos los datos, se configura el estado internamente para asignar cada valor (registro de la colección)
    //como elementos para la lista "docs"
    //En otras palabras, guarda todos los registros de la colección Farmacias en el listado que luego se usará para mostrarlos en pantalla.
    db.read().then((value) => {
          setState(() {
            docs = value;
          })
        });
  }

  //Se inicia el estado de la conexión...
  @override
  void initState() {
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
        title: const Text("Categorías"),
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
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: ButtonTheme(
              minWidth: double.infinity,
              height: 45.0,
              child: FlatButton(
                  color: Colors.blue[800],

                  //Esta función permite al botón realizar una acción, por ahora NO está definida la acción, así que si ve
                  //otras lineas comentadas, no las borre por favor.
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoriaSeleccionada(
                                categoria: docs[index], db: db)));
                  },
                  child: Text(
                    docs[index]['nombre'],
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontFamily: "Tahoma",
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}
