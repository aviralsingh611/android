import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_flutter/phoneNumber.dart';
import 'package:login_flutter/frame.dart';
import 'package:login_flutter/otp.dart';
import 'package:login_flutter/profile.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC835kypqfZPeTR1isYQY3-qfE5KeVgVvY",
            projectId: "otplogin-1c2da",
            messagingSenderId: "788040969894",
            appId: "1:788040969894:android:3a626b7c77836ec6d4ce67",
        )
    );
  } catch (e) {
    print("Firebase initialization error !!!!: $e");
  }
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'frame',
      debugShowCheckedModeBanner: false,
      routes: {
        'frame': (context) => frame(),
        'phone': (context) => phoneNumber(),
        'otp': (context) => myotp(),
        'profile': (context) =>profileselect(),
      },
    );
  }
}
