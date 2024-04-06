import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_rest_api/counter/counter_screen/counter_bloc_screen.dart';
import 'package:todo_rest_api/counter/slider/slider_bloc/slider_bloc.dart';
import 'package:todo_rest_api/counter/slider/slider_screen/slider_screen.dart';
import 'package:todo_rest_api/image_picker/image_picker_bloc/image_picker_bloc.dart';
import 'package:todo_rest_api/image_picker/image_picker_screen/image_picker_screen.dart';
import 'package:todo_rest_api/screens/loginPage.dart';
import 'package:todo_rest_api/todo_list/todo_list.dart';
import 'package:todo_rest_api/whatsapp_ui/whatsapp_ui.dart';

import 'counter/counter_bloc/counter_bloc.dart';
import 'image_picker/image_picker_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc(),),
        BlocProvider(create: (context) => SliderBloc(),),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils())),
      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        // ThemeData(
        //   // Colors.black,
        //   primarySwatch: Colors.red,
        //
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        //   useMaterial3: true,
        // ),
        home:  WhatsAppUI(),
      ),
    );
  }
}

