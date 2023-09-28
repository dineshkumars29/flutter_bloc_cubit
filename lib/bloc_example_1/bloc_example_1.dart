import 'package:bloccubit/bloc_example_1/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}
//! BlocConsumer example

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  // final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("title"),
        ),
        body: BlocListener<CounterBloc, CounterState>(
          listener: (context, state) {
            if (state.counter == 3) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        content: Text("Your Count is ${state.counter}"),
                      ));
            } else if (state.counter == -1) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return OtherPage();
              }));
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  "${context.watch<CounterBloc>().state.counter}",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "btn-1",
              onPressed: () {
                context.read<CounterBloc>().add(IncrementCounterEvent());
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              // heroTag is importent for two floataction button using one screen
              heroTag: "btn-2",
              onPressed: () {
                BlocProvider.of<CounterBloc>(context)
                    .add(DecrementCounterEvent());
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Center(child: Text("Other Page"))));
  }
}
