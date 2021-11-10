import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_patron/repository/authentication_repository.dart';

class Login extends StatelessWidget {
  const Login({Key? key, required authenticationRepository()})
      : assert(authenticationRepository != null),
        super(key: key);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository()
    );
  }
}
