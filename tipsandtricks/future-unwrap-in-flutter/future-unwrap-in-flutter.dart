// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

extension Unwrap<T> on Future<T?> {
  Future<T> unwrap() => then(
        (value) => value != null 
          ? Future<T>.value(value) 
          : Future.any([]),
      );
}

@immutable
class ImagePickerHelper {
  static final ImagePicker _imagePicker = ImagePicker();
  static Future<File> pickImageFromGallery() => _imagePicker
      .pickImage(source: ImageSource.gallery)
      .unwrap()
      .then((xFile) => xFile.path)
      .then((filePath) => File(filePath));
}
