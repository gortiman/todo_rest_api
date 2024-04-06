import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_rest_api/image_picker/image_picker_bloc/image_picker_event.dart';
import 'package:todo_rest_api/image_picker/image_picker_bloc/image_picker_state.dart';
import 'package:todo_rest_api/image_picker/image_picker_util.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState>{
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(
      this.imagePickerUtils
      ): super(ImagePickerState()){
    on<ImagePickerCamera>(_pickImageByCamera);
    on<ImagePickerGallery>(_pickImageByGallery);
  }

  void _pickImageByCamera(ImagePickerCamera events, Emitter<ImagePickerState> emit) async{
    XFile? file = await imagePickerUtils.pickImageByCamera();
    emit(state.copyWith(file: file));
  }

  void _pickImageByGallery(ImagePickerGallery events, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(file: file));
  }
}

