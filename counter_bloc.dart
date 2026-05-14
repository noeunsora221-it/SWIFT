import 'counter_event.dart';
import 'counter_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advance_flutter/counter_bloc.dart';

// Bloc will be handle the results
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counter: 0)) {
    on<IncrementEvent>((event, emit) {
      // Increment the counter
      emit(CounterState(counter: state.counter + 1));
    });

    on<DecrementEvent>((event, emit) {
      // Decrement the counter
      emit(CounterState(counter: state.counter - 1));
    });
  }
}