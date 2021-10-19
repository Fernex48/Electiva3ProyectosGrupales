import 'dart:async';
import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
// import 'autenticacion/modelo/user.dart';
import 'package:login_patron/repository/autenticacion/modelo/user.dart';

// error al registrarse

class SignUpFailure implements Exception {}

// error en el login

class LogInWithEmailAndPasswordFailure implements Exception {}

// error en validación con Google

class LogInWithGoogleFailure implements Exception {}

// error al cerrar sesión

class LogOutFailure implements Exception {}

// autenticacion del sitio

class AuthenticationRepository {
  final firebase_auth.FirebaseAuth _firebaseauth;
  final GoogleSignIn _googleSignIn;

  AuthenticationRepository(
      {required firebase_auth.FirebaseAuth firebaseauth,
      required GoogleSignIn googleSignIn})
      : _firebaseauth = firebaseauth,
        _googleSignIn = googleSignIn;

  Stream<Usuario> get usuario {
    return _firebaseauth.authStateChanges().map((firebaseUsuario) {
      return firebaseUsuario == null
          ? Usuario.vacio
          : firebaseUsuario.toUsuario;
    });
  }

  //registro de la aplicacion por correo y contraseña
  Future<void> signUp(
      {required String correo, required String password}) async {
    assert(correo != null, password != null);
    try {
      await _firebaseauth.createUserWithEmailAndPassword(
          email: correo, password: password);
    } on Exception {
      throw SignUpFailure();
    }
  }

  //Login con Google
  Future<void> logInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final Credential = firebase_auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await _firebaseauth.signInWithCredential(credential);
    } on Exception {
      throw LogInWithGoogleFailure();
    }
  }
}

extension on firebase_auth.User {
  Usuario get toUsuario {
    return Usuario(id: uid, email: email, nombre: displayName, foto: photoURL);
  }
}
