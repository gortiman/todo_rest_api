import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_rest_api/image_picker/image_picker_bloc/image_picker_bloc.dart';
import 'package:todo_rest_api/image_picker/image_picker_bloc/image_picker_event.dart';
import 'package:todo_rest_api/image_picker/image_picker_bloc/image_picker_state.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
        centerTitle: true,
      ),
      body: BlocBuilder<ImagePickerBloc,ImagePickerState>(
        builder: (context,state) {

          return state.file == null ? InkWell(
            onTap: (){
              context.read<ImagePickerBloc>().add(ImagePickerCamera());
            },
              child: Icon(Icons.camera)
          ): Image.file(File(state.file!.path.toString()), height: 300,width: 300,);
        }
      ),
    );
  }
}
