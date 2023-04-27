import 'package:aula5/departamento/domain/entities/departamento.dart';
import 'package:json_annotation/json_annotation.dart';

part 'departamento.g.dart';

@JsonSerializable()
class DepartamentoModel extends DepartamentoEntity {
  DepartamentoModel({
    super.departamentoID,
    required super.nome,
    required super.descricao,
  });

  factory DepartamentoModel.fromJson(Map<String, dynamic> json) =>
      _$DepartamentoModelFromJson(json);

  Map<String, dynamic> toJson() => _$DepartamentoModelToJson(this);
}
