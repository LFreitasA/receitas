import 'package:flutter/material.dart';
import 'package:receitasdavovozinha/classes/ingrediente.dart';

class CadastrarIngredientes extends StatelessWidget {
  CadastrarIngredientes({Key? key}) : super(key: key);

  TextEditingController ingredienteNome = TextEditingController();
  TextEditingController porcao = TextEditingController();
  TextEditingController preco = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          createTextFormField(
              "Nome do ingrediente", ingredienteNome, TextInputType.name, null),
          createTextFormField("Porcao", porcao,
              TextInputType.numberWithOptions(decimal: false), "ml"),
          createTextFormField("Preco", preco, TextInputType.number, null),
          TextButton(
            onPressed: () {
              Ingrediente ingrediente = Ingrediente(ingredienteNome.text,
                  int.parse(porcao.text), double.parse(preco.text));
              listaDeIngredientes.add(ingrediente);
              print(listaDeIngredientes);
            },
            child: Text("submit"),
          ),
          TextButton(
            onPressed: () {},
            child: Text("Limpar"),
          ),
        ],
      ),
    );
  }

  TextFormField createTextFormField(String labelName,
      TextEditingController texto, TextInputType inputType, String? end) {
    return TextFormField(
      controller: texto,
      keyboardType: inputType,
      decoration: InputDecoration(
          label: Text(labelName), suffix: end == null ? null : Text("ml")),
    );
  }
}
