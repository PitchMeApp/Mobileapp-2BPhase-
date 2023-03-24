import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:pitch_me_app/utils/colors/colors.dart';

class AddImageController extends GetxController {
  List<Media> listImagePaths = [];
  GalleryMode _galleryMode = GalleryMode.image;

  int count = 4;
  String filePath = "";
  String fileFullPath = "";

  Future<void> selectImages() async {
    try {
      _galleryMode = GalleryMode.image;
      listImagePaths = await ImagePickers.pickerPaths(
        galleryMode: _galleryMode,
        showGif: true,
        selectCount: 4,
        showCamera: true,
        cropConfig: CropConfig(enableCrop: true, height: 1, width: 1),
        compressSize: 500,
        uiConfig: UIConfig(
          uiThemeColor: DynamicColor.blue,
        ),
      );

      // if (_listImagePaths.length > 0) {
      //   _listImagePaths.forEach((media) {
      //     print(media.path.toString());
      //   });
      // }
      update();
    } on PlatformException {}
  }

  Future<void> getDocumnetFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(allowedExtensions: ['pdf', 'doc'], type: FileType.custom);

      if (result != null) {
        PlatformFile file = result.files.first;
        filePath = result.files.first.name.toString();
        fileFullPath = result.files.first.path.toString();
      } else {}
    } on PlatformException {}

    update();
  }
}
