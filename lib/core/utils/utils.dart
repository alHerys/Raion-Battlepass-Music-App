import 'dart:io';

import 'package:file_picker/file_picker.dart';

Future<File?> pickFile({required FileType fileType}) async {
  try {
    final result = await FilePicker.platform.pickFiles(type: fileType);

    if (result != null) {
      return File(result.files.first.xFile.path);
    } else {
      return null;
    }
  } catch (e) {
    print(e.toString());
    return null;
  }
}
