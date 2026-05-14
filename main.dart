// Learning Advance Flutters
import 'dart:io';

import 'package:advance_flutter/counter_bloc.dart';
import 'package:advance_flutter/counter_event.dart';
import 'package:advance_flutter/counter_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      title: "Advance flutters",
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: BlocProvider(
                create: (_) => CounterBloc(),
                child: BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Text(
                          "Login State",
                          style: TextStyle(
                            fontSize: 33,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Counter : ${state.counter}"),
                        ElevatedButton(
                          onPressed: () {
                            context.read<CounterBloc>().add(IncrementEvent());
                          },
                          child: Text("Increment"),
                        ),

                        ElevatedButton(
                          onPressed: () {
                            context.read<CounterBloc>().add(DecrementEvent());
                          },
                          child: Text("Decrement"),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            Text("Bloc in Flutter"),
            SafeArea(
              child: Column(
                children: [
                  BlocProvider(
                    create: (_) => CounterBloc(),
                    child: BlocBuilder<CounterBloc, CounterState>(
                      builder: (context, state) =>
                          Text("Counter Bloc : ${state.counter}"),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(IncrementEvent());
                    },
                    child: Text("BLoc Increments"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(DecrementEvent());
                    },
                    child: Text("Decrement"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
