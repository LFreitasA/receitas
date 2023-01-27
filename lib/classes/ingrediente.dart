List<Ingrediente> listaDeIngredientes = [];

class Ingrediente {
  String nome;
  int porcao;
  double preco;

  Ingrediente(this.nome, this.porcao, this.preco);

  @override
  String toString() {
    // TODO: implement toString
    return "nome: $nome, porcao: $porcao, preco: $preco";
  }
}
