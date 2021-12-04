import 'package:flutter/material.dart';
import 'package:medicinasyfarmacias/database/dbcategorias.dart';
import 'package:medicinasyfarmacias/pantallas/medicamento_select.dart';

// ignore: must_be_immutable
class CategoriaSeleccionada extends StatefulWidget {
  CategoriaSeleccionada({Key? key, required this.categoria, required this.db})
      : super(key: key);
  Map categoria;
  DatabaseCategorias db;
  @override
  _CategoriaSeleccionadaState createState() => _CategoriaSeleccionadaState();
}

class _CategoriaSeleccionadaState extends State<CategoriaSeleccionada> {
  late DatabaseCategorias db;
  List docs = [];
  initialise() {
    db = DatabaseCategorias();
    db.initiliase();
    db.readMedicinas(widget.categoria['id']).then((value) => {
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
        backgroundColor: const Color(0xAAFA94FD),
        title: const Text("Medicamentos"),
      ),
      body: ListView.builder(
        itemCount: docs.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ButtonTheme(
              minWidth: double.infinity,
              height: 45.0,
              // ignore: deprecated_member_use
              child: FlatButton(
                color: Colors.blue[600],
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MedSeleccionado(medicina: docs[index], db: db)));
                },
                child: Text(
                  docs[index]['nombre'],
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontFamily: "Tahoma",
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
