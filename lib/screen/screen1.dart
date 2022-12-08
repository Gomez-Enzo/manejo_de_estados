import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manejo_de_estados/cubit/usuario/usuario_cubit.dart';

import '../models/usuario.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context.read<UsuarioCubit>().borrarUsuario(),
          )
        ],
      ),
      body: BlocBuilder<UsuarioCubit, UsuarioState>(
        builder: (_, state) {
          if (state is UsuarioInitial) {
            return const Center(
              child: Text('No hay informacion del usuario'),
            );
          } else if (state is UsuarioActivo) {
            return InformationUsuario(usuario: state.usuario);
          } else {
            return const Center(child: Text('Estado no reconocido'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'screen2'),
        child: const Icon(Icons.ac_unit_rounded),
      ),
    );
  }
}

class InformationUsuario extends StatelessWidget {
  const InformationUsuario({
    Key? key,
    required this.usuario,
  }) : super(key: key);
  final Usuario usuario;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad:  ${usuario.edad}'),
          ),
          const Text(
            'Profesiones',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          ...usuario.profesiones!
              .map(
                (profesion) => ListTile(
                  title: Text(profesion),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
