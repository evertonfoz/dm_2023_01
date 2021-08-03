import 'package:automacaoresidencial/componentes/com_alert_dalog.dart';
import 'package:automacaoresidencial/model/model_agendamento.dart';
import 'package:automacaoresidencial/view/agendamentos/view_agendamento.dart';
import 'package:automacaoresidencial/view_model/view_model_bluetooth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class ListaDispositivos extends StatefulWidget {
  
  @required
  final List<BluetoothDevice> listDevices;
  @required
  final FlutterBluetoothSerial bluetoothSerial;
  @required
  final Function restarHomePage;

  ListaDispositivos({this.listDevices, this.bluetoothSerial, this.restarHomePage});

  @override
  _ListaDispositivosState createState() => _ListaDispositivosState();
}

class _ListaDispositivosState extends State<ListaDispositivos> {

  ViewModelBluetooth viewModelBluetooth = new ViewModelBluetooth();
  ModAgendamento modAgendamento = new ModAgendamento();





  deviceSelected(BluetoothDevice device){
    loadinConnect(context);
    viewModelBluetooth.statusBluetoothSmatphoneAtivo(widget.bluetoothSerial).then((value) async => {
      if(value){
        await Future.delayed(Duration(milliseconds: 500)),

        viewModelBluetooth.connectBluetooth(device, widget.bluetoothSerial).then((value1) => {
          // ignore: deprecated_member_use
          value1.isConnected.then((value1) async => {
            if(value1){
              Navigator.pop(context),
              Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAgendamento(device: device, bluetoothSerial: widget.bluetoothSerial,))),
            }else{
              Navigator.pop(context),
              falha("Bluetooth", "Falha na conexão tente novamente!", context),
            }
          })
        })
        

      }else{
        Navigator.pop(context),
        falha("Bluetooth", "Ative seu bluetooth e tente novamente!", context),
        widget.restarHomePage(value)
      }

    });
  }





  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: ListView.builder(
        itemCount: widget.listDevices.length ,
        itemBuilder: (BuildContext context, int index){

          var device = widget.listDevices[index];

          return GestureDetector(
            onTap: () => deviceSelected(device),
            child:PhysicalModel(
              elevation: 10,
              color: Colors.white, 
              child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height *0.07,
                  color: Colors.black12,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Icon(
                          Icons.bluetooth,
                          size: MediaQuery.of(context).size.height*0.05,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              device.name,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.brown
                              ),  
                            ),
                            Text(
                              device.address,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black
                              ),  
                            )
                          ],
                        ),
                      )
                    ],
                  ),
              )
            )
          );
        }
      )
    );
  }
}