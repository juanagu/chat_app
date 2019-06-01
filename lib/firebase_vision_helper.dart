import 'dart:io';

import 'package:chat_app/presentation/commons/language_utils.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:firebase_mlkit_language/firebase_mlkit_language.dart';

abstract class FirebaseVisionHelper {
  static FirebaseVisionImage getVisionImageFromFile(File file) {
    return FirebaseVisionImage.fromFile(file);
  }

  static Future<List<Barcode>> barcodeDetector(File file) async {
    final FirebaseVisionImage visionImage = getVisionImageFromFile(file);
    final BarcodeDetector detector = FirebaseVision.instance.barcodeDetector();
    return await detector.detectInImage(visionImage);
  }

  static Future<List<Face>> faceDetector(File file) async {
    final FirebaseVisionImage visionImage = getVisionImageFromFile(file);
    final FaceDetector detector = FirebaseVision.instance.faceDetector();
    return await detector.processImage(visionImage);
  }

  static Future<List<ImageLabel>> imageLabeler(File file) async {
    final FirebaseVisionImage visionImage = getVisionImageFromFile(file);
    final ImageLabeler labeler = FirebaseVision.instance.imageLabeler();
    return await labeler.processImage(visionImage);
  }

  static Future<List<ImageLabel>> cloudImageLabeler(File file) async {
    final FirebaseVisionImage visionImage = getVisionImageFromFile(file);
    final ImageLabeler labeler = FirebaseVision.instance.cloudImageLabeler();
    return await labeler.processImage(visionImage);
  }

  static Future<VisionText> textDetector(File file) async {
    final FirebaseVisionImage visionImage = getVisionImageFromFile(file);
    final TextRecognizer recognizer = FirebaseVision.instance.textRecognizer();
    return await recognizer.processImage(visionImage);
  }

  static Future<String> translate(String text) async {
    var instance = FirebaseLanguage.instance;
    List<LanguageLabel> languages =
        await instance.languageIdentifier().processText(text);

    var fromLanguage = languages.first.languageCode.toString();
    var toLanguage = await LanguageUtils.getLanguage();

    await instance.modelManager().downloadModel(fromLanguage);

    final languageTranslator =
        instance.languageTranslator(fromLanguage, toLanguage);

    return await languageTranslator.processText(text);
  }
}
