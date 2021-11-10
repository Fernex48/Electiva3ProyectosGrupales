// POR AHORA NO HAY QUE HACER CASO A LOS IMPORTS QUE ESTAN COMENTADOS, QUE NO SE BORREN PERO TAMPOCO SE USEN

// ignore_for_file: deprecated_member_use, camel_case_types
//import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:medicinasyfarmacias/pantallas/sucursales.dart';
//import '../funciones/funciones.dart';
import 'package:flutter/material.dart';
import 'package:medicinasyfarmacias/database/dbfarmacias.dart';

//El Stateful que conocemos, aquí se crea toda la metodología donde se interactúa con la base de datos.
//Se necesita un contexto dentro del método donde se realizar la consulta a la base de datos, por eso fue más
//conveniente hacer las consultas aquí
class Farmacias extends StatefulWidget {
  const Farmacias({Key? key}) : super(key: key);

  @override
  _FarmaciasState createState() => _FarmaciasState();
}

class _FarmaciasState extends State<Farmacias> {
  //El ícono y el widget en estas líneas son para crear la barra de búsqueda dentro del AppBar
  Icon customIcon = const Icon(Icons.search);
  Widget cusSearchBar = const Text("Farmacias");

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
        title: cusSearchBar,
        //Las acciones que permitirán colocar más widgets dentro del appbar, esto hará posible añadir un botón para la búsqueda
        actions: <Widget>[
          //El botón con ícono
          IconButton(
            onPressed: () {
              //Aquí se logra que, al presionar en el botón, cuando este tiene un ícono de lupa, se cambie a un ícono de "cancelar" y
              //habilite un cuadro de texto en lugar del título "Farmacias"
              //Y si se presiona el botón cuando éste tiene un ícono de cancelar, se regresa al ícono de "buscar", desaparece
              //el cuadro de texto y vuelve a aparecer el título "Farmacias"
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.cancel);
                  cusSearchBar = const TextField(
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Buscar farmacia",
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  );
                } else {
                  customIcon = const Icon(Icons.search);
                  cusSearchBar = const Text("Farmacias");
                }
              });
            },
            icon: customIcon,
          ),
        ],
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
                    //Navigator.push(context,
                    //MaterialPageRoute(builder: (context) => const Sucursales()));
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


//-----------------------------------------------------
//TODO A PARTIR DE AQUÍ NO SE UTILIZARÁ MÁS-----------------
//-----------------------------------------------------


//El contenedor para todos los botones de las categorías
/*
Widget contenedorFarmacia() {
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
          "",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        SizedBox(height: 20),
        botonFarmacia(nombreBoton: 'Farmacias Economicas'),
        SizedBox(height: 15),
        botonFarmacia(nombreBoton: 'Farmacias San Nicolas'),
        SizedBox(height: 15),
        botonFarmacia(nombreBoton: 'Farmacia CEFAFA'),
        SizedBox(height: 15),
        botonFarmacia(nombreBoton: 'Farmacialasamericas'),
        SizedBox(height: 15),
        botonFarmacia(nombreBoton: 'Farmacia Beethoven'),
        SizedBox(height: 15),
        botonFarmacia(nombreBoton: 'Farmacia La Salud'),
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

class botonFarmacia extends StatelessWidget {
  const botonFarmacia({Key? key, required this.nombreBoton}) : super(key: key);
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Sucursales()));
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

/*Widget botonFarmacia2(String nombreBoton) {
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
*/
