import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:receitasdavovozinha/firebase_options.dart';

import 'classes/strings.dart';
import 'views/home.dart';
import 'views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

//  FirebaseAuth.instance.createUserWithEmailAndPassword(
//      email: "emailteste@mail.com", password: "123456");

//  await FirebaseAuth.instance.signInWithEmailAndPassword(
//      email: "emailtesste@mail.com", password: "123456");

//  await FirebaseAuth.instance.signOut();

  await FirebaseAuth.instance.userChanges().listen((user) {
    if (user != null) {
      print("Usuario autenticado");
    } else {
      print("Usuario não autenticado");
    }
  });

  final data1 = await FirebaseDatabase.instance.ref("/app/Version").get();
  print(data1.value);
  //final data = await FirebaseDatabase.instance.ref("/app/name").get();
  print("ssss");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Home(),
        ),
      ),
    );
  }
}
