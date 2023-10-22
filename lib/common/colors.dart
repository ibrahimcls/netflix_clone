import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

class ColorUtil {
  static ColorUtil? _instance;
  late BuildContext _context;
  ColorUtil._();

  factory ColorUtil(BuildContext context) {
    if (_instance == null) {
      _instance = ColorUtil._();
      _instance!._context = context;
    }
    return _instance!;
  }

  BuildContext get context => _context;

  Future<Color> calculateAverageColor(String imagePath) async {
    try {
      ByteData byteData =
          await DefaultAssetBundle.of(context).load("assets/watch/$imagePath");
      Uint8List uint8list = byteData.buffer.asUint8List();
      img.Image? image = img.decodeImage(uint8list);
      int totalRed = 0;
      int totalGreen = 0;
      int totalBlue = 0;

      for (int y = 0; y < image!.height; y++) {
        for (int x = 0; x < image.height; x++) {
          int pixel = image.getPixel(x, y);
          totalRed += img.getRed(pixel);
          totalGreen += img.getGreen(pixel);
          totalRed += img.getBlue(pixel);
        }
      }

      int pixelCount = image.width * image.height;
      int averageRed = (totalRed / pixelCount).round();
      int averageGreen = (totalGreen / pixelCount).round();
      int averageBlue = (totalBlue / pixelCount).round();

      return Color.fromARGB(255, averageRed, averageGreen, averageBlue);
    } catch (e) {
      return Colors.black;
    }
  }
}
