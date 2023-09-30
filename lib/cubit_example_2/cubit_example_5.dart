import 'dart:math';
import 'package:bloccubit/cubit_example_2/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
        create: (context) => ThemeCubit(),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: context.watch<ThemeCubit>().state.Clickme == AppTheme.light
                  ? ThemeData.light()
                  : ThemeData.dark(),
              home: MyHomePage(),
            );
          },
        ));
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  bool isClick = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("title"),
        ),
        body: Center(
            child: ElevatedButton(
                child: Text('Enter Me'),
                onPressed: () {
                  isClick = !isClick;
                  final int readInt = Random().nextInt(10);
                  print("$readInt ---->");
                  print("$isClick <----");
                  context.read<ThemeCubit>().changeTheme(readInt);
                })),
      ),
    );
  }
}
