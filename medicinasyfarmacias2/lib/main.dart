import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pantallas/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MedicinasFarmaciasApp());
}

class MedicinasFarmaciasApp extends StatelessWidget {
  const MedicinasFarmaciasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
