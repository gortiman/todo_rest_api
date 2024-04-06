import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_rest_api/counter/counter_bloc/counter_bloc_events.dart';
import 'package:todo_rest_api/counter/counter_bloc/counter_bloc_states.dart';

import '../counter_bloc/counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Bloc"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
          builder: (BuildContext context, state) {
            return Text(state.counter.toString(),
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
            );
          },

          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (){
                    context.read<CounterBloc>().add(IncrementEvent());
                  },
                  child: Text("Add"
                  )
              ),

              SizedBox(width: 20,),
              ElevatedButton(
                  onPressed: (){
                    context.read<CounterBloc>().add(DecrementEvent());
                  },
                  child: Text("Sub"
                  )
              )
            ],
          ),

        ],
      ),
    );
  }
}
