import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:receitasdavovozinha/classes/ingrediente.dart';

class ListarIngredientes extends StatelessWidget {
  const ListarIngredientes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text("Ingrediente"),
            Text("Tamanho da porção"),
            Text("Preco")
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: listaDeIngredientes.length,
            itemBuilder: ((context, index) {
              return Container(
                height: 50,
                width: 100,
                color: index % 2 == 0 ? Colors.black45 : Colors.white,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(listaDeIngredientes[index].nome),
                      Text(
                          "${listaDeIngredientes[index].porcao.toString()} ml"),
                      Text(listaDeIngredientes[index].preco.toString()),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
