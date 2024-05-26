import 'package:flutter/material.dart';
import 'dart:io';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:image/image.dart' as img;

class DisplayPage extends StatefulWidget {
  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  String? _imagePath;
  List<File>? _faceImages;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as String;
    _imagePath = args;
    _detectFaces();
  }

  Future<void> _detectFaces() async {
    final imageFile = File(_imagePath!);
    final inputImage = InputImage.fromFile(imageFile);
    final faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        enableContours: true,
        enableLandmarks: true,
      ),
    );

    final faces = await faceDetector.processImage(inputImage);
    final faceImages = <File>[];

    for (final face in faces) {
      final boundingBox = face.boundingBox;
      final imageBytes = await imageFile.readAsBytes();
      final originalImage = img.decodeImage(imageBytes)!;

      final faceImage = img.copyCrop(
        originalImage,
        boundingBox.left.toInt(),
        boundingBox.top.toInt(),
        boundingBox.width.toInt(),
        boundingBox.height.toInt(),
      );

      final directory = await getApplicationDocumentsDirectory();
      final facesDirectory = Directory(path.join(directory.path, 'faces'));
      if (!await facesDirectory.exists()) {
        await facesDirectory.create(recursive: true);
      }

      final faceFile = File(
        path.join(facesDirectory.path, 'face_${DateTime
            .now()
            .millisecondsSinceEpoch}.png'),
      );

      faceFile.writeAsBytesSync(img.encodePng(faceImage));
      faceImages.add(faceFile);
    }

    setState(() {
      _faceImages = faceImages;
    });

    await faceDetector.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              if (_faceImages != null)
                ..._faceImages!.map((faceImage) =>
                    _buildAvatarWithStaticImage(faceImage)).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarWithStaticImage(File faceImage) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: FileImage(faceImage),
                  backgroundColor: Colors.grey[300],
                ),
              ),
              SizedBox(width: 16),
              Image.asset(
                'assets/images/egy-eagle.png',
                height: 160,
                width: 160,
              ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: Text('go to home page', style: TextStyle(color: Colors.white),), // Set the button text
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularAvatar(File faceImage) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CircleAvatar(
        radius: 50,
        backgroundImage: FileImage(faceImage),
        backgroundColor: Colors.grey[300],
      ),
    );
  }
}
