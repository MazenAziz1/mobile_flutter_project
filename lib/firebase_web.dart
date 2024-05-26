import 'package:firebase_core/firebase_core.dart';

Future<void> initializeFirebase() async {
  print('Running on Web');
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAw64vnYijxpN7Ikbp0KKy1IbK7SdNYl4A",
      appId: "1:816494665375:android:f67ca37ef0fbbe031d8caa",
      messagingSenderId: "816494665375",
      projectId: "fir-auth-app-60623",
    ),
  );
}
