import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

Future<String?> myImagePicker() async {
  final picker = await ImagePicker().pickImage(source: ImageSource.gallery);
  //for Web
  if (kIsWeb) {
    if (picker == null) return null;
    final str = base64Encode(await picker.readAsBytes());
    return str;
  } else {
    //For mobile
    return picker?.path;
  }
}
