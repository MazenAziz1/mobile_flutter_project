import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class ScanScreen extends StatelessWidget {
  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final directory = await getApplicationDocumentsDirectory();
      final uploadsDirectory = Directory(path.join(directory.path, 'uploads'));
      if (!await uploadsDirectory.exists()) {
        await uploadsDirectory.create(recursive: true);
      }

      final imagePath = path.join(uploadsDirectory.path, 'uploaded_image_${DateTime.now().millisecondsSinceEpoch}.png');
      final imageFile = File(pickedFile.path);
      await imageFile.copy(imagePath);

      Navigator.pushNamed(context, '/display', arguments: imagePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset('assets/images/Capture.PNG2.PNG'), // Ensure your logo is in the assets folder
            SizedBox(height: 20),
            Text(
              'Welcome!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Sign up to continue'),
            SizedBox(
              width: 200, // Adjust width as needed
              height: 50, // Adjust height as needed
              child: ElevatedButton(
                onPressed: () => _pickImage(context), // Call pick image function directly
                child: Stack(
                  alignment: Alignment.centerRight, // Aligning text to the right
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          colors: [Color(0xFFA8271B), Color(0xFFA8271B)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 30, // Adjusted position to the right
                      child: Text(
                        'Click to scan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: Image.asset(
                        'assets/images/img.png',
                        height: 50,
                        width: 55,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/profile');
              },
              child: Text(
                'already scanned?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Spacer(),
            Text(
              'Encryption Assurance: Your documents are safeguarded with state-of-the-art encryption protocols, ensuring that only authorized individuals can access and view the scanned content.\n\n'
                  'Strict Privacy Measures: We prioritize your privacy. Your scanned documents are stored securely, and our app adheres to stringent privacy standards to protect your sensitive information.\n\n'
                  'No Unauthorized Access: Rest easy knowing that our app is designed to prevent unauthorized access. Your scanned documents are accessible only to you, and we employ robust authentication mechanisms to maintain the confidentiality of your data.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
