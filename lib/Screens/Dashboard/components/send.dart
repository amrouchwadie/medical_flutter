import 'dart:convert';
import 'dart:html' as h;
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

Future<Uint8List> _getHtmlFileContent(h.File blob) async {
  Uint8List file;
  final reader = h.FileReader();
  reader.readAsDataUrl(blob.slice(0, blob.size, blob.type));
  reader.onLoadEnd.listen((event) {
    Uint8List data =
        Base64Decoder().convert(reader.result.toString().split(",").last);
    file = data;
  }).onData((data) {
    file = Base64Decoder().convert(reader.result.toString().split(",").last);
    return file;
  });
  while (file == null) {
    await new Future.delayed(const Duration(milliseconds: 1));
    if (file != null) {
      break;
    }
  }
  return file;
}

Future saveRecipe(h.File f) async {
  String urlApi = "http://127.0.0.1:8000/demande_create";

  if (f != null) {
    Uri uri = Uri.parse(urlApi);
    var request = http.MultipartRequest('POST', uri);
    request.fields['medicament'] = "medicament";
    request.fields['Age'] = "ddd";
    request.fields['image'] = "13";
    request.fields['price'] = "dd";
    request.files.add(http.MultipartFile.fromBytes(
        'image', (await _getHtmlFileContent(f)),
        filename: f.name));

    request.send();
  }
}
