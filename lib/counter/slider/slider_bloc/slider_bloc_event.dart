
import 'package:equatable/equatable.dart';

abstract class SliderEvents extends Equatable{
  SliderEvents();

  @override
  List<Object> get props => [];
}

class EnableORDisableEvent extends SliderEvents{}

class SliderIncreaseDecrease extends SliderEvents{
  final double slider;
  SliderIncreaseDecrease({required this.slider});

  @override
  List<Object> get props => [slider];
}