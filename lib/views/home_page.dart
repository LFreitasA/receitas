import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'ingredientes.dart';

class HomeLogada extends StatelessWidget {
  const HomeLogada({Key? key}) : super(key: key);

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
