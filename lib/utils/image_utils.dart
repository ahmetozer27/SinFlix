import 'package:image_picker/image_picker.dart';
import 'dart:io';
class ImageUtils {
  static Future<File?> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      return File(image.path); // Seçilen resim
    } else {
      return null; // kullanıcı iptal etti
    }
  }
}