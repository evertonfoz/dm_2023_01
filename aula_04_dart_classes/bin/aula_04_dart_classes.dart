import 'package:aula_04_dart_classes/produto.dart';

void main(List<String> arguments) {
  var produto = Produto('Camiseta', 23.45, 10);

  print('Nome: ${produto.nome}');
  print('Preço: ${produto.preco}');
  print('Quantidade: ${produto.quantidade}');

  produto.preco = 0;
  //45.67;
  print('Preço: ${produto.preco}');

  // var person = Person();
  // person.name = 'Everton';
  // person.age = 30;

  // person.printInfo();
}
