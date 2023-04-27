// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departamento.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartamentoModel _$DepartamentoModelFromJson(Map<String, dynamic> json) =>
    DepartamentoModel(
      departamentoID: json['departamentoID'] as int?,
      nome: json['nome'] as String,
      descricao: json['descricao'] as String,
    );

Map<String, dynamic> _$DepartamentoModelToJson(DepartamentoModel instance) =>
    <String, dynamic>{
      'departamentoID': instance.departamentoID,
      'nome': instance.nome,
      'descricao': instance.descricao,
    };
