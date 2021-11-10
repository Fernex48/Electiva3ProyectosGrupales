// ignore_for_file: avoid_print, avoid_renaming_method_parameters

import 'package:bloc/bloc.dart';

class simpleBlocObserver extends BlocObserver {
  
  @override
  void onEvent(Bloc bloc, Object evento){
    print(evento);
    super.onEvent(bloc, evento);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace){
    @override
    print(error);
    super.onEvent(cubit, error, stackTrace);
  }

  @override
  void onChange(Cubit cubit, Object change){
    
    print(change);
    super.onEvent(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition){
    
    print(transition);
    super.onTransition(bloc, transition);
  }

}