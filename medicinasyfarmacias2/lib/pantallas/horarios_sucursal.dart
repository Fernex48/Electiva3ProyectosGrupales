// ignore_for_file: deprecated_member_use, camel_case_types

import 'package:flutter/material.dart';
import 'package:medicinasyfarmacias/database/dbfarmacias.dart';

// ignore: must_be_immutable
class HorarioSeleccionado extends StatefulWidget {
  HorarioSeleccionado(
      {Key? key,
      required this.sucursal,
      required this.db,
      required this.idFarmacia})
      : super(key: key);
  Map sucursal;
  DatabaseFarmacias db;
  String idFarmacia;
  @override
  _HorarioSeleccionadoState createState() => _HorarioSeleccionadoState();
}

class _HorarioSeleccionadoState extends State<HorarioSeleccionado> {
  late DatabaseFarmacias db;
  List docs = [];
  initialise() {
    db = DatabaseFarmacias();
    db.initiliase();
    db.readHorarios(widget.idFarmacia, widget.sucursal['id']).then((value) => {
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
        title: const Text("Horarios de atención"),
      ),
      body: ListView.builder(
        itemCount: docs.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: ButtonTheme(
              minWidth: double.infinity,
              height: 60.0,
              child: FlatButton(
                color: Colors.purple[300],
                onPressed: () {},
                // ignore: avoid_unnecessary_containers
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        docs[index]['dia'],
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: "Tahoma",
                        ),
                      ),
                      Text(
                        "De: " +
                            docs[index]['horainicio'] +
                            " A: " +
                            docs[index]['horafin'],
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
