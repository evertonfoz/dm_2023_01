class Produto {
  String _nome;
  double _preco;
  int _quantidade;

  Produto(this._nome, this._preco, this._quantidade);

  String get nome => _nome;

  double get preco => _preco;
  set preco(double value) {
    if (value > 0) {
      _preco = value;
    }
  }

  int get quantidade => _quantidade;
}
