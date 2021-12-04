// ignore_for_file: unused_import, avoid_print, file_names

/*
Este archivo dart contiene las funciones para realizar el CRUD para la colección de "categorias" en la base de "BaseMedicinas2"
Si se quiere acceder a otra colección, se deberá crear otro archivo dart exclusivo para interactuar con esa colección.
*/

// Los imports necesarios para esta clase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

//Se hará referencia a esta clase en el archivo dart en el cual se desea realizar consultas hacia la base.
class DatabaseCategorias {
  //Estas líneas permiten inicializar correctamente la instancia de la conexión a la base.
  late FirebaseFirestore firestore;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  //Función para LEER TODOS los registros
  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore.collection('categorias').get();
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

  //Función para obtener todos los medicamentos pertenecientes a una categoría
  Future<List> readMedicinas(String id) async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore
          .collection('categorias')
          .doc(id)
          .collection('medicinas')
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "id": doc.id,
            "nombre": doc['nombre'],
            "descrip": doc['descrip'],
            "imagen": doc['imagen'],
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

  //ESTAS FUNCIONES NO SE ESTÁN UTILIZANDO. ESTÁN PROGRAMADAS PARA EN UN FUTURO
  //Función para CREAR nuevos registros
  Future<void> create(String name) async {
    try {
      await firestore.collection("categorias").add({
        'nombre': name,
      });
    } catch (e) {
      print(e);
    }
  }

  //Función para ELIMINAR algún registro
  Future<void> delete(String id) async {
    try {
      await firestore.collection("categorias").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  //Función para ACTUALIZAR un registro
  Future<void> update(String id, String name, String code) async {
    try {
      await firestore.collection("categorias").doc(id).update({'nombre': name});
    } catch (e) {
      print(e);
    }
  }
}
