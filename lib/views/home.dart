import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../chamadas_firebase.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController emailController = TextEditingController();

  TextEditingController senhaController = TextEditingController();

  String versao = "";
  @override
  void initState() {
    _loadAppData();
    super.initState();
  }

  _loadAppData() async {
    versao = await getVersion();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final user = snapshot.data;
        if (user == null) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                TextField(
                  controller: senhaController,
                  decoration: InputDecoration(labelText: "Senha"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print(emailController.text);
                        print(senhaController.text);
                        realizarLogin(emailController.text.toString(),
                            senhaController.text.toString());
                      },
                      child: Text("Login"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print(emailController.text);
                        print(senhaController.text);
                        realizarCadastro(emailController.text.toString(),
                            senhaController.text.toString());
                      },
                      child: Text("Cadastrar"),
                    ),
                  ],
                ),
                Text(versao)
              ],
            ),
          );
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(user.email.toString()),
              ElevatedButton(
                  onPressed: () {
                    realizarLogout();
                  },
                  child: Text("Sair"))
            ],
          ),
        );
      },
    );
  }
}
