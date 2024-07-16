import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../innt_vendor/view/api_constant/get_vendorprofile_api.dart';

class GetxControllers extends GetxController {
  XFile? imageFile;
  final getVendorProfile = Get.put(fetchVendorProfile());

  // Future getImage() async {
  //   final ImagePicker _picker = ImagePicker();
  //   final image = await _picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     imagePath.value = image.path.toString();
  //   }
  // }

  void addImage(XFile? image) {
    imageFile = image;
    update();
  }

  getFromGallery() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
    getVendorProfile.vendorProimgupdate(imageFile!.path);
    print("jkgujkhkjhiuhiooihoijoi${imageFile!.path}");
  }

  List<File> _images = [];

  int get imageCount => _images.length;

  List<File> get images => List<File>.unmodifiable(_images);

  void addAllImages(List<File> newImages) {
    _images.addAll(newImages);
    update();
  }
}
