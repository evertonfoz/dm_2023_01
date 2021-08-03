import 'package:automacaoresidencial/componentes/com_alert_dalog.dart';
import 'package:automacaoresidencial/model/model_agendamento.dart';
import 'package:automacaoresidencial/view_model/view_model_bluetooth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class ListAgendamentos extends StatefulWidget {
   @required
    final BluetoothDevice device;
   @required
    final List<ModAgendamento> listAgendamentos;
   @required
    final Function reloadListAgendamentos;
   @required
    final Function deleteAgendamentos;
   @required
    final Function alterAgendamento;
   @required
    final Function enviarAgendamento;

  ListAgendamentos({this.listAgendamentos, this.device, this.reloadListAgendamentos, this.deleteAgendamentos, this.alterAgendamento, this.enviarAgendamento});

  @override
  _ListAgendamentosState createState() => _ListAgendamentosState();
}

class _ListAgendamentosState extends State<ListAgendamentos> {
  
  ViewModelBluetooth viewModelBluetooth = new ViewModelBluetooth();



  @override
  Widget build(BuildContext context) {
    if(widget.listAgendamentos != null){
      return
        ListView.builder(
          itemCount: widget.listAgendamentos.length,
          itemBuilder: (BuildContext context, int index){
            var item = widget.listAgendamentos[index];
            return GestureDetector(
              onTap: ()=>{widget.alterAgendamento(item)},
              child:Padding(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.01, 0, MediaQuery.of(context).size.height*0.01, MediaQuery.of(context).size.height*0.002),
                child: Container(
                  height: MediaQuery.of(context).size.height*0.10,
                  color: Colors.black12,
                  child: Padding(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.02, 0, MediaQuery.of(context).size.height*0.02, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(item.nomeAgendamento,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16
                              ),
                            ),

                            Text("Início: ${viewModelBluetooth.format(item.inicioAgendamento, false)}",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 14
                              ),
                            ),
                          
                            Text("Fim: ${viewModelBluetooth.format(item.fimAgendamento, false)}",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 14
                              ),
                            ),

                            Text("Criado: ${viewModelBluetooth.format(item.dateTimeSave, false)}",
                              style: TextStyle(
                                color: Colors.brown,
                                fontSize: 12
                              ),
                            ),
                          ]
                        ),
                        Expanded(child: Container()),
                        Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height*0.04,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: item.statusAgendamento ? Colors.green :Colors.blue  
                          ),
                          child: item.statusAgendamento 
                          ? Padding(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.01, MediaQuery.of(context).size.height*0.01, MediaQuery.of(context).size.height*0.01, MediaQuery.of(context).size.height*0.01),
                            child: Text(
                                "Dados enviados",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.height*0.015
                                ),
                              ),
                            )
                          : TextButton(
                            child: Text(
                              "Enviar dados",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.height*0.015
                              ),
                            ),
                            onPressed: ()=>{widget.enviarAgendamento(item)},
                          ),
                        ),
                        Expanded(child: Container()),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.delete_rounded,
                                size: MediaQuery.of(context).size.height*0.04,
                                color: Colors.black45
                              ),
                              onPressed: () => {dialogAgendamento("Apagar","Deseja realmente apagar?", context, widget.deleteAgendamentos, item),
                                
                              },
                            ),
                          ]
                        ),
                      ],
                    ),
                  )
                ),
              ),
            );
          }
        
      );
    }
    else{
      return Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 10, 0),
              child:Text(
                "Nenhum agendamento encontrado",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  color: Colors.red,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}