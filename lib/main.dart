import 'package:blog_minimal/app_widget.dart';
import 'package:blog_minimal/models/user.dart';
import 'package:blog_minimal/screens/home_page.dart';
import 'package:blog_minimal/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAHHwluB2ZlwwE7XcPnCsWPFajYp06vAoc',
          appId: '1:103941839785:android:9d39e2da754442d42902b8',
          messagingSenderId: '103941839785',
          projectId: 'blog-app-c18f4'));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create:((context) => UserPrimary()),)
    ],
    child:  const MaterialApp(
      home: AppWidget(),
    ),
  ));
}
