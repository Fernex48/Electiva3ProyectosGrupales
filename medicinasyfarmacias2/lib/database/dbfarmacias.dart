// ignore_for_file: unused_import, avoid_print, file_names

/*

Este archivo dart contiene las funciones para realizar el CRUD para la colección de "farmacias" en la base de "BaseMedicinas2"

Si se quiere acceder a otra colección, se deberá crear otro archivo dart exclusivo para interactuar con esa colección.

*/

// Los imports necesarios para esta clase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

//Se hará referencia a esta clase en el archivo dart en el cual se desea realizar consultas hacia la base.
class DatabaseFarmacias {
  //Estas líneas permiten inicializar correctamente la instancia de la conexión a la base.
  late FirebaseFirestore firestore;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  //Función para LEER TODOS los registros (Este SI SE ESTÁ UTILIZANDO)
  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore.collection('farmacias').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {"id": doc.id, "nombre": doc['nombre']};
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return read();
  }

  //Función para LEER UNICAMENTE LOS DATOS de las sucursales de UNA farmacia

  Future<List> readSucursales(String id) async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore
          .collection('farmacias')
          .doc(id)
          .collection('sucursales')
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "id": doc.id,
            "nombre": doc['nombre'],
            "direccion": doc['direccion'],
            "telefono": doc['telefono'],
            "latitud": doc['latitud'],
            "longitud": doc['longitud'],
          };
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return read();
  }

  //Función para CREAR nuevos registros (de momento no se está utilizando)
  Future<void> create(String name) async {
    try {
      await firestore.collection("farmacias").add({
        'nombre': name,
      });
    } catch (e) {
      print(e);
    }
  }

  //Función para ELIMINAR algún registro (de momento no se está utilizando)
  Future<void> delete(String id) async {
    try {
      await firestore.collection("farmacias").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  //Función para ACTUALIZAR un registro (de momento no se está utilizando)
  Future<void> update(String id, String name, String code) async {
    try {
      await firestore.collection("farmacias").doc(id).update({'nombre': name});
    } catch (e) {
      print(e);
    }
  }
}
