import 'dart:async';
// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/auth/presentation/login_page.dart';
// import 'features/santri/presentation/santri_list_page.dart';
// import 'features/rapor/presentation/rapor_page.dart';
// import 'features/penilaian/presentation/input_penilaian_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-Penilaian Santri',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
