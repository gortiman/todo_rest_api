

import 'package:bloc/bloc.dart';
import 'package:todo_rest_api/counter/counter_bloc/counter_bloc_events.dart';
import 'package:todo_rest_api/counter/counter_bloc/counter_bloc_states.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() :super(CounterState()){
    on<IncrementEvent>(_increment);
    on<DecrementEvent>(_decrement);
  }

  void _increment(IncrementEvent event, Emitter<CounterState> emit  ){
    emit(state.copyWith(counter: state.counter+1));
  }

  void _decrement(DecrementEvent event, Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter-1));
  }
}