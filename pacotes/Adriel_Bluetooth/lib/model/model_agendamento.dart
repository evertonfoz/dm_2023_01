import 'package:automacaoresidencial/persistencia/dao_agendamento.dart';

class ModAgendamento{

  int idAgendamento;
  String nomeAgendamento;
  String inicioAgendamento;
  String fimAgendamento;
  String dateTimeSave;
  bool statusAgendamento;
  bool statusNotificacao;
  String macAdress;

  ModAgendamento({this.idAgendamento, this.nomeAgendamento, this.inicioAgendamento, 
  this.fimAgendamento, this.statusAgendamento, this.statusNotificacao, this.macAdress, this.dateTimeSave});


Map<String, dynamic> setMap() {
    var map = <String, dynamic>{
      'id_agendamento': idAgendamento,
      'nome_agendamento': nomeAgendamento,
      'inicio_agendamento': inicioAgendamento ,
      'fim_agendamento': fimAgendamento ,
      'status_agendamento': (statusAgendamento == true ? 'true' : 'false'),
      'status_notificacao': (statusNotificacao == true ? 'true' : 'false'),
      'mac_adress': macAdress,
      'datetime_save': dateTimeSave
    };
    return map;
  }

  ModAgendamento.getMap(Map<String, dynamic> map) {
    idAgendamento = map['id_agendamento'];
    nomeAgendamento = map['nome_agendamento'];
    inicioAgendamento = map['inicio_agendamento'];
    fimAgendamento = map['fim_agendamento'];
    statusAgendamento = (map['status_agendamento'] == 'true' ? true : false);
    statusNotificacao = (map['status_notificacao'] == 'true' ? true : false);
    macAdress = map['mac_adress'];
    dateTimeSave = map['datetime_save'];
    
  }


  Future<List<ModAgendamento>> getAllAgendamentos(String macAdress) async {

    DaoAgendamento daoAgendamento = new DaoAgendamento();
    List<ModAgendamento> listAgendamento = <ModAgendamento>[];

    try {
      for(ModAgendamento agendamento in await daoAgendamento.geAllDados()){
        if(macAdress == agendamento.macAdress){
          listAgendamento.add(agendamento);
        }
      }

      return listAgendamento;

    } catch (e) {
      return null;
    }
  }
}