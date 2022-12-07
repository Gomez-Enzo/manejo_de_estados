import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manejo_de_estados/cubit/usuario/usuario_cubit.dart';
import 'package:manejo_de_estados/screen/screen1.dart';

import 'screen/screen2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UsuarioCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'screen1',
        routes: {
          'screen1': (_) => const Screen1(),
          'screen2': (_) => const Screen2(),
        },
      ),
    );
  }
}
