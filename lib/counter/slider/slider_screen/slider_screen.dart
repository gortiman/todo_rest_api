

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_rest_api/counter/slider/slider_bloc/slider_bloc_event.dart';

import '../slider_bloc/slider_bloc.dart';
import '../slider_bloc/slider_bloc_state.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider Screen"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text("Notification",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
              ),
              
              BlocBuilder<SliderBloc, SliderState>(
                buildWhen: (previous, current) => previous.isSwitch != current.isSwitch,
                builder: (context,state) {
                  print("Switch bloc");
                  return Switch(value: state.isSwitch, onChanged: (newValue){
                    context.read<SliderBloc>().add(EnableORDisableEvent());
                  });
                }
              )
            ],
          ),

          BlocBuilder<SliderBloc,SliderState>(
            buildWhen: (previous, current) => previous.slider != current.slider,
            builder: (context,state) {
              print("container bloc");
              return Container(
                width: 200,
                height: 200,
                color: Colors.green.withOpacity(state.slider),
              );
            }
          ),

          BlocBuilder<SliderBloc, SliderState>(
              // buildWhen: (previous, current) => previous.slider != current.slider,
            buildWhen:(previous, current) => previous.slider != current.slider,
            builder: (context,state) {
              print("slider bloc");
              return Slider(value: state.slider, onChanged: (value){
                context.read<SliderBloc>().add(SliderIncreaseDecrease(slider: value));
              });
            }
          )
        ],
      ),
    );
  }
}
