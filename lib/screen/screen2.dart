import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manejo_de_estados/cubit/usuario/usuario_cubit.dart';

import '../models/usuario.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final newUser = Usuario(nombre: 'Enzo', edad: 21, profesiones: [
                  'Estudiante de ingenieria',
                  'Estudiante de Flutter'
                ]);
                context.read<UsuarioCubit>().seleccionarUsuario(newUser);
              },
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                context.read<UsuarioCubit>().cambiarEdad(20);
              },
              child: const Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                context
                    .read<UsuarioCubit>()
                    .agregarProfesion('Tecnico en electronica');
              },
              child: const Text(
                'Añadir Profesion',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
