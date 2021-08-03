import 'package:automacaoresidencial/model/model_agendamento.dart';
import 'package:automacaoresidencial/persistencia/dao_agendamento.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class ViewModelAgendamento{
  DaoAgendamento daoAgendamento = new DaoAgendamento();

  Future<bool> add(ModAgendamento agendamento, BluetoothDevice device) async {
   
    try {
      if(agendamento.idAgendamento == null){
        await desabilitaStatusAgendamento(device);
        await daoAgendamento.insert(agendamento);
      }else{
        await desabilitaStatusAgendamento(device);
        await daoAgendamento.update(agendamento);
      }

      return true;
    } catch (e) {}
    return false;
  }

  Future<void> desabilitaStatusAgendamento(BluetoothDevice device) async{
    
    ModAgendamento modAgendamentoAux = new ModAgendamento();
    try {
      for(ModAgendamento item in await modAgendamentoAux.getAllAgendamentos(device.address)){
        if(item.statusAgendamento){
          item.statusAgendamento = false;
          await daoAgendamento.update(item);
        }
      }
    } catch (e) {
      return;
    }
  }

  Future<bool> delete(ModAgendamento agendamento) async {
    
    try {
      await daoAgendamento.delete(agendamento);
      return true;
    } catch (e) {
    }
    return false;
  }


}