import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/usuario.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());
  void seleccionarUsuario(Usuario user) {
    emit(UsuarioActivo(user));
  }

  void cambiarEdad(int edad) {
    final currentState = state;

    if (currentState is UsuarioActivo) {
      final newUser = currentState.usuario.copyWith(edad: edad);
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion(String profesion) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newProfesiones = [
        ...?currentState.usuario.profesiones,
        profesion,
      ];
      final newUser =
          currentState.usuario.copyWith(profesiones: newProfesiones);
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
  //UsuarioCubit(super.initialState);
}
