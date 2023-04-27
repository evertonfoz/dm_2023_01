// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'funcionario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FuncionarioModel _$FuncionarioModelFromJson(Map<String, dynamic> json) =>
    FuncionarioModel(
      funcionarioID: json['funcionarioID'] as int?,
      nome: json['nome'] as String,
      sobrenome: json['sobrenome'] as String,
      endereco: json['endereco'] as String,
      telefone: json['telefone'] as String,
    );

Map<String, dynamic> _$FuncionarioModelToJson(FuncionarioModel instance) =>
    <String, dynamic>{
      'funcionarioID': instance.funcionarioID,
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'endereco': instance.endereco,
      'telefone': instance.telefone,
    };
