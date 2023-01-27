import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

void realizarLogin(String email, String senha) async {
  print("object");

  await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: senha);
}

void realizarLogout() async {
  print("object");
  await FirebaseAuth.instance.signOut();
}

void realizarCadastro(String email, String senha) async {
  print("object");

  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: senha);
}

Future getVersion() async {
  final data = await FirebaseDatabase.instance.ref("/app/Version").get();
  print(data.value);
  return data.value;
}
