import 'package:aula5/funcionario/domain/entities/funcionario.dart';
import 'package:json_annotation/json_annotation.dart';

part 'funcionario.g.dart';

@JsonSerializable()
class FuncionarioModel extends FuncionarioEntity {
  const FuncionarioModel({
    super.funcionarioID,
    required super.nome,
    required super.sobrenome,
    required super.endereco,
    required super.telefone,
  });

  factory FuncionarioModel.fromJson(Map<String, dynamic> json) =>
      _$FuncionarioModelFromJson(json);

  Map<String, dynamic> toJson() => _$FuncionarioModelToJson(this);
}
