import 'package:automacaoresidencial/componentes/com_alert_dalog.dart';
import 'package:automacaoresidencial/componentes/com_bar_navigation.dart';
import 'package:automacaoresidencial/componentes/com_button_add.dart';
import 'package:automacaoresidencial/model/model_agendamento.dart';
import 'package:automacaoresidencial/view/agendamentos/add_agendamento_diario.dart';
import 'package:automacaoresidencial/view/agendamentos/list_agendamentos.dart';
import 'package:automacaoresidencial/view_model/view_model_agendamento.dart';
import 'package:automacaoresidencial/view_model/view_model_bluetooth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class ViewAgendamento extends StatefulWidget {

  @required
  final BluetoothDevice device;
  @required
  final FlutterBluetoothSerial bluetoothSerial;


  ViewAgendamento({this.device, this.bluetoothSerial});

  @override
  _ViewAgendamentoState createState() => _ViewAgendamentoState();
}

class _ViewAgendamentoState extends State<ViewAgendamento> {

  ViewModelBluetooth viewModelBluetooth = new ViewModelBluetooth();
  ViewModelAgendamento viewModelAgendamento = new ViewModelAgendamento();
  List<ModAgendamento> listAgendamentos = <ModAgendamento>[];
  ModAgendamento modAgendamento = new ModAgendamento();




  disconectBluetooth(){
    viewModelBluetooth.disconnect(widget.bluetoothSerial);
    Navigator.pop(context);
  }
  
  reloadListAgendamentos(){
    setState(() {});
  }

  Future<void> lodingListAgendamento() async {
     listAgendamentos = await modAgendamento.getAllAgendamentos(widget.device.address);
     await Future.delayed(Duration(milliseconds: 500));

     //print(listAgendamentos[0].idAgendamento);
  }

  buttonAdd() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddAgendamentoDiario(device:  widget.device, reloadListAgendamentos: reloadListAgendamentos, bluetoothSerial: widget.bluetoothSerial,)));
  }

  deleteAgendamentos(ModAgendamento modAgendamento) async {
    
    await viewModelBluetooth.statusBluetoothSmatphoneAtivo(widget.bluetoothSerial).then((bluetoothAtivo) => {
      if(bluetoothAtivo){
        // ignore: deprecated_member_use
        widget.bluetoothSerial.isConnected.then((isConnect) async => {
          if(isConnect){
            if(modAgendamento.statusAgendamento){
              viewModelBluetooth.sendMensage(null, widget.bluetoothSerial),
            },
            viewModelAgendamento.delete(modAgendamento).then((value) => {
              if(value){
                reloadListAgendamentos()
              }
            }),
          }else{
            Navigator.pop(context),
            falha("Bluetooth","Bluetooth desconectado", context),
          }
        })
      }else{
        Navigator.pop(context),
        falha("Bluetooth","Bluetooth desativado", context),
      }
    });
  }

  alterAgendamento(ModAgendamento getModAgendamento){
   Navigator.push(context, MaterialPageRoute(builder: (context) => AddAgendamentoDiario(device:  widget.device, reloadListAgendamentos: reloadListAgendamentos, modAgendamento1: getModAgendamento, bluetoothSerial: widget.bluetoothSerial)));
  }
  
  enviarAgendamentoFromList(ModAgendamento modAgendamentoAux) async {

    await viewModelBluetooth.statusBluetoothSmatphoneAtivo(widget.bluetoothSerial).then((bluetoothAtivo) => {
      if(bluetoothAtivo){
        // ignore: deprecated_member_use
        widget.bluetoothSerial.isConnected.then((isConnect) async => {
          if(isConnect){

            viewModelBluetooth.sendMensage(modAgendamentoAux, widget.bluetoothSerial),

            modAgendamentoAux.statusAgendamento = true,
            loadinSendAndSaveConnect(context),
            await viewModelAgendamento.add(modAgendamentoAux, widget.device).then((value) async => {
              if(value){
                await Future.delayed(Duration(seconds: 1)),
                Navigator.pop(context),
              }
            }),
            reloadListAgendamentos(),
          }else{
            Navigator.pop(context),
            falha("Bluetooth","Bluetooth desconectado", context),
          }
        })
      }else{
        Navigator.pop(context),
        falha("Bluetooth","Bluetooth desativado", context),
      }
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: lodingListAgendamento(),
        builder: (context, future){

          if(future.connectionState != ConnectionState.waiting){
          return Container(
            child: Column(
              children: <Widget>[
                BarNavigation(texttitle: "${widget.device.name}", buttonBackClick: disconectBluetooth,),

                Expanded(
                  child: ListAgendamentos(
                    listAgendamentos: listAgendamentos, 
                    reloadListAgendamentos: reloadListAgendamentos, 
                    device: widget.device, 
                    deleteAgendamentos: deleteAgendamentos, 
                    alterAgendamento: alterAgendamento,
                    enviarAgendamento: enviarAgendamentoFromList,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: Container()),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 15, 15),
                      child: ComButtonAdd(
                        buttonCliked: buttonAdd,
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
          }else{
            return Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            );
          }
        },
      ),
    );
  }
}