part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;
  const CounterState({
    required this.counter,
  });

//! created by me
  factory CounterState.initial() {
    return const CounterState(counter: 0);
  }

//! generate from Equatable package
//? --> have error with [counter] <--
  @override
  List<Object?> get props => [counter];

//! generate toString property by 'dart data class generator' plugin
  @override
  String toString() => 'CounterState(counter: $counter)';

//! generate copyWith property by 'dart data class generator' plugin
  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}
