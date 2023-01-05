import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rest_or_rant/screens/auth_gate.dart';
import 'package:rest_or_rant/screens/utils/theme.dart';

void main() async {
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getTheme(),
      home: const AuthGate(),
    );
  }
}
