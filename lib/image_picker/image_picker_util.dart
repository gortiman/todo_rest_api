import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  ImagePicker imagePicker = ImagePicker();

  Future<XFile?> pickImageByCamera() async{
    final XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> pickImageFromGallery() async{
    final XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    return file;
  }
}



/// source code
// https://github.com/axiftaj/FLutter-Bloc-Tutorials/tree/main/lib