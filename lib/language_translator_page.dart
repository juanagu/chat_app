import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:chat_app/firebase_vision_helper.dart';

class LanguageTranslatorPage extends StatefulWidget {
  @override
  LanguageTranslatorPageState createState() => LanguageTranslatorPageState();
}

class LanguageTranslatorPageState extends State<LanguageTranslatorPage> {
  File pickedImage;

  bool isImageLoaded = false;
  String text = "";
  String translationText = "";

  Future pickImage() async {
    var tempStore = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      pickedImage = tempStore;
      isImageLoaded = true;
    });
  }

  Future readText() async {
    var tempReadText = "";

    if (pickedImage != null) {
      VisionText readText =
          await FirebaseVisionHelper.textDetector(pickedImage);

      for (TextBlock block in readText.blocks) {
        tempReadText += block.text;
        for (TextLine line in block.lines) {
          for (TextElement word in line.elements) {
            print(word.text);
          }
        }
      }

      tempReadText = await FirebaseVisionHelper.translate(tempReadText);

      setState(() {
        text = tempReadText;
      });
    }
  }

  Future decode() async {
    List barCodes = await FirebaseVisionHelper.barcodeDetector(pickedImage);

    var tempReadText = "BARCODE: ";
    for (Barcode readableCode in barCodes) {
      tempReadText += readableCode.displayValue;
      print(readableCode.displayValue);
    }
    setState(() {
      text = tempReadText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lectura de textos en imagenes"),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 100.0),
            isImageLoaded
                ? Center(
                    child: Column(children: <Widget>[
                    Container(
                        height: 200.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(pickedImage),
                                fit: BoxFit.cover))),
                    Text(text),
                    buildTranslateOptions()
                  ]))
                : Container(),
            SizedBox(height: 10.0),
            RaisedButton(
              child: Text('Pick an image'),
              onPressed: pickImage,
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              child: Text('Read Text'),
              onPressed: readText,
            ),
            RaisedButton(
              child: Text('Read Bar Code'),
              onPressed: decode,
            )
          ],
        ));
  }

  Widget buildTranslateOptions() {
    if (translationText.isEmpty) {
      return Container();
    } else {
      return Text("Translation: " + translationText);
    }
  }
}
