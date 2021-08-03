import 'package:automacaoresidencial/model/model_agendamento.dart';
import 'package:automacaoresidencial/view_model/view_model_notificacao.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:intl/intl.dart';

class ViewModelBluetooth {
  Future<List<BluetoothDevice>> bluetoothConnectionState(FlutterBluetoothSerial bluetoothGET) async {
    List<BluetoothDevice> devices = [];

      // Obtemos a lista de dispositivos pareados
    try {
      devices = await bluetoothGET.getBondedDevices();
    } on PlatformException {
        //print("Error");
    }catch (e){}
      
    if (devices.length != 0) {
      return devices;
    }
      
    return null;
  }

    //verifica se smatfhone esta com o bluetooth ativo
  Future<bool> statusBluetoothSmatphoneAtivo(FlutterBluetoothSerial bluetoothGET)async {

    bool status;
    await bluetoothGET.isEnabled.then((value) => {
        status = value
    });
    return status;
  }

    //verifica se estão conectados
  Future<bool> statusBluetoothIsConnected(FlutterBluetoothSerial bluetoothGET) async {
    bool status;
      // ignore: deprecated_member_use
    bluetoothGET.isConnected.then((value) => {
      status = value,
    });
    return status;
  }

    // Método que conecta o bluetooth
  Future<FlutterBluetoothSerial> connectBluetooth(BluetoothDevice device, FlutterBluetoothSerial bluetoothGET) async {
    // ignore: deprecated_member_use
    await bluetoothGET.connect(device).timeout(Duration(seconds: 10)).catchError((error) {});
    return bluetoothGET;
  }

  void disconnect(FlutterBluetoothSerial bluetoothGET) {
    // ignore: deprecated_member_use
    bluetoothGET.disconnect();
  }

  void sendMensage(ModAgendamento agendamento, FlutterBluetoothSerial bluetoothGET){

    ViewModelNotificacao viewModelNotificacao = new ViewModelNotificacao();

    if(agendamento != null){  
      ModAgendamento modAgendamento = new ModAgendamento();
      modAgendamento.idAgendamento          = agendamento.idAgendamento;
      modAgendamento.macAdress              = agendamento.macAdress;
      modAgendamento.nomeAgendamento        = agendamento.nomeAgendamento;
      modAgendamento.statusAgendamento      = agendamento.statusAgendamento;
      modAgendamento.statusNotificacao      = agendamento.statusNotificacao;
      modAgendamento.dateTimeSave           = format(agendamento.dateTimeSave, true);
      modAgendamento.inicioAgendamento      = format(agendamento.inicioAgendamento, false);
      modAgendamento.fimAgendamento         = format(agendamento.fimAgendamento, false);
        
      // ignore: deprecated_member_use
      bluetoothGET.write(agendamento.setMap().toString());
      print(agendamento.setMap().toString());

      if(agendamento.statusNotificacao){
        viewModelNotificacao.configureNotification(agendamento);
      }

    }else{
        // ignore: deprecated_member_use
      bluetoothGET.write("");
    }
      //print(texto);
  }













  format(String datetime, bool segundos){
    var newDate = DateTime.parse(datetime);
    if(segundos){
      final DateFormat formatter = DateFormat('dd-MM-yyyy HH:mm:ss');
      return formatter.format(newDate);
    }else{
      final DateFormat formatter = DateFormat('dd-MM-yyyy HH:mm');
      return formatter.format(newDate);
    }
      
  }
}