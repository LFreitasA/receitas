import 'package:flutter/material.dart';

import 'view_cadastrar_ingredientes.dart';
import 'view_listar_ingredientes.dart';

class MeusIngredientes extends StatelessWidget {
  const MeusIngredientes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
              labelColor: Colors.orange,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  text: "Lista de ingredientes",
                ),
                Tab(
                  text: "Cadastrar Ingredientes",
                ),
              ]),
          Expanded(
              child: TabBarView(children: [
            ListarIngredientes(),
            CadastrarIngredientes(),
          ]))
        ],
      ),
    );
  }
}
