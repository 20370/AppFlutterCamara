import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CapturePhotoScreen(),
    );
  }
}

class CapturePhotoScreen extends StatefulWidget {
  @override
  _CapturePhotoScreenState createState() => _CapturePhotoScreenState();
}

class _CapturePhotoScreenState extends State<CapturePhotoScreen> {
  XFile? _capturedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _captureImage() async {
    XFile? capturedImage = await _picker.pickImage(source: ImageSource.camera);
    if (capturedImage != null) {
      setState(() {
        _capturedImage = capturedImage;
      });
    }
  }

  Future<void> _recaptureImage() async {
    await _captureImage(); // Capturar una nueva imagen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capturar Foto'),
      ),
      body: Center(
        child: _capturedImage == null
            ? Text('No se ha capturado ninguna foto.')
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.file(
                    File(_capturedImage!.path),
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _recaptureImage,
                    child: Text('Recapturar Foto'),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _captureImage,
        tooltip: 'Capturar Foto',
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
