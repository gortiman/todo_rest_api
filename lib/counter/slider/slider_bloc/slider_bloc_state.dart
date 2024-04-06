import 'package:equatable/equatable.dart';

class SliderState extends Equatable{
  final bool isSwitch;
  final double slider;

  SliderState({
    this.isSwitch = true,
    this.slider = 1.0
});

  SliderState copyWith( {bool? isSwitch,double? slider}){
    return SliderState(
      isSwitch: isSwitch?? this.isSwitch,
      slider: slider?? this.slider,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isSwitch, slider];
}