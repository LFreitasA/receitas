import 'package:flutter/material.dart';

import '../chamadas_firebase.dart';
import 'ingredientes.dart';

class HomeLogada extends StatefulWidget {
  const HomeLogada({Key? key}) : super(key: key);

  @override
  State<HomeLogada> createState() => _HomeLogadaState();
}

class _HomeLogadaState extends State<HomeLogada> {
  @override
  void initState() {
    buscarDados();
    super.initState();
  }

  void buscarDados() async {
    Map ingredientes = await getIngredientes();
    print("ingredientes[0");
    print(ingredientes[0]);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: const [
          TabBar(
              labelColor: Colors.orange,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  text: "Receitas",
                ),
                Tab(
                  text: "Receitas",
                ),
                Tab(
                  text: "Ingredientes",
                ),
              ]),
          Expanded(
              child: TabBarView(children: [
            Text("Receitas"),
            Text("Cadastrar Receitas"),
            MeusIngredientes(),
          ]))
        ],
      ),
    );
  }
}
