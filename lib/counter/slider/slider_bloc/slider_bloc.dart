
import 'package:bloc/bloc.dart';
import 'package:todo_rest_api/counter/slider/slider_bloc/slider_bloc_event.dart';
import 'package:todo_rest_api/counter/slider/slider_bloc/slider_bloc_state.dart';

class SliderBloc extends Bloc<SliderEvents, SliderState>{
  SliderBloc() : super(SliderState()){
    on<EnableORDisableEvent>(_enableDisable);
    on<SliderIncreaseDecrease>(_sliderIncreaseDecrease);
  }

  void _enableDisable(EnableORDisableEvent event, Emitter<SliderState> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _sliderIncreaseDecrease(SliderIncreaseDecrease events, Emitter<SliderState> emit){
    emit(state.copyWith(slider: events.slider.toDouble()));
  }
}