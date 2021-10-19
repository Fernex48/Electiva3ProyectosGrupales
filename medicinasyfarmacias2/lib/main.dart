import 'package:flutter/material.dart';
//import 'pantallas/cat_seleccionada.dart';
//import 'pantallas/categorias.dart';
//import 'pantallas/farmacias.dart';
//import 'pantallas/informacion.dart';
import 'pantallas/login.dart';
//import 'pantallas/medicamento_select.dart';
//import 'pantallas/menu.dart';
//import 'pantallas/registro.dart';
//import 'pantallas/sucursal_seleccionada.dart';
//import 'pantallas/sucursales.dart';

void main() {
  runApp(const MedicinasFarmaciasApp());
}

class MedicinasFarmaciasApp extends StatelessWidget {
  const MedicinasFarmaciasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //home: CategoriaSeleccionada(),
      //home: Categorias(),
      //home: Farmacias(),
      //home: Informacion(),
      home: Login(),
      //home: MedSeleccionado(),
      //home: MenuApp(),
      //home: Registro(),
      //home: SucursalSeleccioanda(),
      //home: Sucursales(),
    );
  }
}
