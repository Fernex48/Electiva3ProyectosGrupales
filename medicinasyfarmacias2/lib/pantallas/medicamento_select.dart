// ignore_for_file: deprecated_member_use, camel_case_types

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:medicinasyfarmacias/database/dbcategorias.dart';
import 'package:medicinasyfarmacias/funciones/funciones.dart';

// ignore: must_be_immutable
class MedSeleccionado extends StatefulWidget {
  MedSeleccionado({Key? key, required this.medicina, required this.db})
      : super(key: key);
  Map medicina;
  DatabaseCategorias db;
  @override
  _MedSeleccionadoState createState() => _MedSeleccionadoState();
}

String nombreM = "";
String descripcionM = "";
String imagenM = "";

class _MedSeleccionadoState extends State<MedSeleccionado> {
  @override
  void initState() {
    super.initState();
    nombreM = widget.medicina['nombre'];
    descripcionM = widget.medicina['descrip'];
    imagenM = widget.medicina['imagen'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Centra el título que está contenido dentro del appbar...
        centerTitle: true,
        //color de fondo del appbar
        backgroundColor: const Color(0xAAAA94FF),
        //Texto "Farmacias"
        title: const Text("Medicamento seleccionado"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xAAD2FEFF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 15),
            tituloPantalla(nombreM),
            const SizedBox(
              height: 20,
            ),
            // Aquí agregar la imagen
            FutureBuilder(
              future: _getImage(context, imagenM),
              builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.width / 1.2,
                    child: snapshot.data,
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.width / 1.2,
                    child: const CircularProgressIndicator(),
                  );
                }
                return Container();
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              descripcionM,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

Future<Widget> _getImage(BuildContext context, String imageName) async {
  late Image image;
  await FireStoreService.loadImage(context, imageName).then((value) {
    image = Image.network(
      value.toString(),
      fit: BoxFit.scaleDown,
    );
  });
  return image;
}

class FireStoreService extends ChangeNotifier {
  FireStoreService();
  // ignore: non_constant_identifier_names
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}
