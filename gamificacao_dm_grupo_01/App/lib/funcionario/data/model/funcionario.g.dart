// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'funcionario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FuncionarioModel _$FuncionarioModelFromJson(Map<String, dynamic> json) =>
    FuncionarioModel(
      funcionarioID: json['funcionarioID'] as int?,
      nome: json['nome'] as String,
    );

Map<String, dynamic> _$FuncionarioModelToJson(FuncionarioModel instance) =>
    <String, dynamic>{
      'funcionarioID': instance.funcionarioID,
      'nome': instance.nome,
    };
