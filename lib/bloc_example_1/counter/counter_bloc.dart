import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<IncrementCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });

    on<DecrementCounterEvent>(_decrementCount);
  }
  void _decrementCount(
      DecrementCounterEvent event, Emitter<CounterState> emitter) {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(counter: state.counter - 1));
  }
}
