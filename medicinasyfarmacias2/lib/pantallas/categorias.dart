import 'package:flutter/material.dart';
import 'package:medicinasyfarmacias/database/dbcategorias.dart';
import 'package:medicinasyfarmacias/pantallas/cat_seleccionada.dart';

class Categorias extends StatefulWidget {
  const Categorias({Key? key}) : super(key: key);

  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  late DatabaseCategorias db;
  List docs = [];
  initialise() {
    db = DatabaseCategorias();
    db.initiliase();
    db.read().then((value) => {
          setState(() {
            docs = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF81F4DA),
      appBar: AppBar(
        centerTitle: true,
        //color de fondo del appbar
        backgroundColor: const Color(0xAAFA94FD),
        //Texto "Farmacias"
        title: const Text("Categorías"),
      ),
      body: ListView.builder(
        itemCount: docs.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: ButtonTheme(
              minWidth: double.infinity,
              height: 45.0,
              // ignore: deprecated_member_use
              child: FlatButton(
                  color: Colors.blue[800],
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
