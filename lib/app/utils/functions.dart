import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

void closeKeyboard(){
  FocusManager.instance.primaryFocus?.unfocus();
}

Future<File> downloadImageWithDio(String imageUrl) async {
  final dio = Dio();

  // Cria um nome de arquivo com base na URL
  final fileName = basename(imageUrl);

  // Pega o diretório temporário do sistema
  final dir = await getTemporaryDirectory();
  final filePath = '${dir.path}/$fileName';

  // Faz o download da imagem e salva no arquivo
  final response = await dio.get<List<int>>(
    imageUrl,
    options: Options(
      responseType: ResponseType.bytes,
    ),
  );

  final file = File(filePath);
  await file.writeAsBytes(response.data!);

  return file;
}

int? toInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is double) return value.toInt();
  if (value is String) {
    final parsed = int.tryParse(value);
    if (parsed != null) return parsed;
    final parsedDouble = double.tryParse(value);
    if (parsedDouble != null) return parsedDouble.toInt();
  }
  return null;
}