import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/usuario.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());
  void seleccionarUsuario(Usuario user) {
    emit(UsuarioActivo(user));
  }
  //UsuarioCubit(super.initialState);
}
