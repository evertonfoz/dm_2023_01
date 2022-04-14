import '../domain/produto.dart';

class ProdutosDataSource {
  final List<Produto> _produtos = [];

  adicionarProduto({required Produto produto}) {
    _produtos.add(produto);
  }

  List<Produto> produtos() {
    return _produtos;
  }
}
