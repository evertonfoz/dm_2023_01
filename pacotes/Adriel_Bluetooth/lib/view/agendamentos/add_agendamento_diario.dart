import 'package:automacaoresidencial/componentes/com_alert_dalog.dart';
import 'package:automacaoresidencial/componentes/com_bar_navigation.dart';
import 'package:automacaoresidencial/componentes/com_divider.dart';
import 'package:automacaoresidencial/componentes/com_entry.dart';
import 'package:automacaoresidencial/componentes/com_entry_datetime.dart';
import 'package:automacaoresidencial/model/model_agendamento.dart';
import 'package:automacaoresidencial/view_model/view_model_agendamento.dart';
import 'package:automacaoresidencial/view_model/view_model_bluetooth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class AddAgendamentoDiario extends StatefulWidget {
   @required
    final BluetoothDevice device;
   @required
    final ModAgendamento modAgendamento1;
   @required
    final Function reloadListAgendamentos;
   @required
    final FlutterBluetoothSerial bluetoothSerial;


  AddAgendamentoDiario({this.device, this.modAgendamento1, this.reloadListAgendamentos, this.bluetoothSerial});
  @override
  _AddAgendamentoState createState() => _AddAgendamentoState();
}

class _AddAgendamentoState extends State<AddAgendamentoDiario> {

  ViewModelAgendamento viewModelAgendamento = new ViewModelAgendamento();
  ModAgendamento modAgendamento = new ModAgendamento();

  bool notificacao = true;
  String inicioAgendamento = DateTime.now().toString();
  String fimAgendamento = DateTime.now().add(Duration(minutes: 2)).toString();
  String nomeAgendamento = "Agendamento";





  @override
    void initState() {
      super.initState();
      if(widget.modAgendamento1 != null){
        setState(() { 
          notificacao       = widget.modAgendamento1.statusNotificacao;
          nomeAgendamento   = widget.modAgendamento1.nomeAgendamento;
          inicioAgendamento = widget.modAgendamento1.inicioAgendamento;
          fimAgendamento    = widget.modAgendamento1.fimAgendamento;
        });
      }
    }

  void voltar(){
    Navigator.pop(context);
  }

  Future<void> saveAndSend() async {
    ViewModelBluetooth viewModelBluetooth = new ViewModelBluetooth();
    loadinSendAndSaveConnect(context);
    
    try {
      modAgendamento.idAgendamento = widget.modAgendamento1.idAgendamento;
    } catch (e) {}
    
    modAgendamento.fimAgendamento = fimAgendamento;
    modAgendamento.inicioAgendamento = inicioAgendamento;
    modAgendamento.nomeAgendamento = nomeAgendamento;
    modAgendamento.statusAgendamento = true;
    modAgendamento.statusNotificacao = notificacao;
    modAgendamento.macAdress = widget.device.address;
    modAgendamento.dateTimeSave = DateTime.now().toString();

    print(modAgendamento.inicioAgendamento);
    await viewModelBluetooth.statusBluetoothSmatphoneAtivo(widget.bluetoothSerial).then((bluetoothAtivo) => {
      if(bluetoothAtivo){
        // ignore: deprecated_member_use
        widget.bluetoothSerial.isConnected.then((isConnect) async => {
          if(isConnect){
            if(DateTime.parse(inicioAgendamento).isBefore(DateTime.parse(fimAgendamento))){
              if(fimAgendamento != null && inicioAgendamento != null && nomeAgendamento != null){

                await viewModelAgendamento.add(modAgendamento, widget.device).then((value)  async => {
                  if(value){
                    await Future.delayed(Duration(seconds: 1)),
                    Navigator.pop(context),
                    Navigator.pop(context),
                    widget.reloadListAgendamentos(),
                  }
                }),
              }else{
                await Future.delayed(Duration(microseconds: 500)),
                Navigator.pop(context),
                falha("Campos", "Campos em branco!", context),
              },
            }else{
              Navigator.pop(context),
                falha("Campos", "Data final deve ser maior que a inicial", context),
            },
            
            viewModelBluetooth.sendMensage(modAgendamento, widget.bluetoothSerial),
          }else{
            Navigator.pop(context),
            Navigator.pop(context),
            Navigator.pop(context),
            falha("Bluetooth","Bluetooth desconectado", context),
          }
        })
      }else{
        Navigator.pop(context),
        Navigator.pop(context),
        Navigator.pop(context),
        falha("Bluetooth","Bluetooth desativado", context),
      }
    });
  }

  void entryNome(String nome){
    nomeAgendamento = nome;
  }

  void datatimeInicial(DateTime date){
    inicioAgendamento = date.toString();
  }

  void datatimeFinal(DateTime date){
    fimAgendamento = date.toString();
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        child: SingleChildScrollView(
          child: Column(
          children: <Widget>[
            BarNavigation(texttitle: widget.modAgendamento1 == null ? "Novo Agendamento" : "Alterar Agendamento", buttonBackClick: voltar,),
             
            Padding(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.015, MediaQuery.of(context).size.height*0.01, MediaQuery.of(context).size.height*0.015, MediaQuery.of(context).size.height*0.01),
             
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.black12,
                  child: Padding(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.02, MediaQuery.of(context).size.height*0.02, MediaQuery.of(context).size.height*0.02, MediaQuery.of(context).size.height*0.02),
                  child: Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.02, 0, MediaQuery.of(context).size.height*0.05),
                        child: PhysicalModel(
                          child: Padding(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.01, MediaQuery.of(context).size.height*0.005, MediaQuery.of(context).size.height*0.01, MediaQuery.of(context).size.height*0.005),
                            child:Text(
                              "Insira o agendamento",
                              style: 
                              TextStyle(
                                fontSize: MediaQuery.of(context).size.height*0.022, 
                                color: Colors.white,
                                ),
                            ),
                          ),
                          color: Colors.black38,
                          elevation: 10,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),

                      
                       Text("Nome agendamento",  
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height*0.0165,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      ComEntry(lblText: "Nome", startEntry: nomeAgendamento, entryResult: entryNome,),

                      ComDivider(),

                      //DATA TIME INICIAL
                      Text("Data tempo inicial:",  
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height*0.0165,
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      ComEntryDateTime(callBack: datatimeInicial,initialValue: inicioAgendamento == null ? DateTime.now() : DateTime.parse(inicioAgendamento)),

                      ComDivider(),

                        //DATA TIME FINAL
                      Text("Data tempo final:",  
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height*0.0165,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                        
                      ComEntryDateTime(callBack: datatimeFinal, initialValue: fimAgendamento == null ? DateTime.now().add(Duration(minutes: 5)) : DateTime.parse(fimAgendamento),),
                      
                      //NOTIFICAÇÃO
                      ComDivider(),

                      Text("Notificação:", 
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height*0.0165,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      //Expanded(child: Container()),
                      Checkbox(
                        value: notificacao == null ? true : notificacao, 
                        onChanged: (value)=> setState(() {
                            notificacao = value; 
                        })
                      ),
                    ],
                  ),
                ),
              ),
            ),



            Padding(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.016, MediaQuery.of(context).size.height*0.1, MediaQuery.of(context).size.height*0.016, MediaQuery.of(context).size.height*0.016),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blue
                ),
                child: TextButton(
                  child: Text(
                    "Salvar e Enviar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height*0.018
                    ),
                  ),
                  onPressed: ()=>{
                    saveAndSend(),
                  },
                ),
              ),
            ),
          ],
        ),
        )
      ),
    );
  }
}



