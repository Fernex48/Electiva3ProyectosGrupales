import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'app.dart';
import 'SimpleBlocObserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = simpleBlocObserver();
  runApp(const Login());
}
