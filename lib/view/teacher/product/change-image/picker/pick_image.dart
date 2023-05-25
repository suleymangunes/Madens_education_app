import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PickImage {
  pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      var image = await picker.pickImage(source: ImageSource.gallery);

      final File file = File(image!.path);
      return image.path;
    } catch (e) {
      print(e);
    }
    return null;
  }
}

class PickVideo {
  pickVideo() async {
    final ImagePicker picker = ImagePicker();
    try {
      var image = await picker.pickVideo(source: ImageSource.gallery);
      final File file = File(image!.path);
      return image.path;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
