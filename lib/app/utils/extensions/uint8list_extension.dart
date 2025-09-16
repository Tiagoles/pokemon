import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

extension Uint8ListExtension on Uint8List{
  Future<File> toFile(fileName) async {
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/$fileName');
    await file.writeAsBytes(this);
    return file;
  }
}