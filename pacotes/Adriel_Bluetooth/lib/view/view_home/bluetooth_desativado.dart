import 'package:automacaoresidencial/componentes/com_alert_dalog.dart';
import 'package:automacaoresidencial/componentes/com_button_default.dart';
import 'package:automacaoresidencial/view_model/view_model_bluetooth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import 'bar_home.dart';

class BluetoothDesativado extends StatefulWidget {

  @required
  final FlutterBluetoothSerial bluetoothGET;

  @required
  final Function restarHomePage;

  BluetoothDesativado({this.bluetoothGET, this.restarHomePage});

  @override
  _BluetoothDesativadoState createState() => _BluetoothDesativadoState();
}

class _BluetoothDesativadoState extends State<BluetoothDesativado> {
  
  ViewModelBluetooth viewModelBluetooth = new ViewModelBluetooth();




  buttonAtualizarClick(){
    //print("value");
    viewModelBluetooth.statusBluetoothSmatphoneAtivo(widget.bluetoothGET).then((value) => {
      if(value){
        widget.restarHomePage(value),
      }
      else{
        falha("Bluetooth", "Ative seu bluetooth e tente novamente!", context)
      }
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            BarHome(),
            Expanded(child: Container()),
            Icon(
              Icons.bluetooth_disabled_outlined,
              size: MediaQuery.of(context).size.height*0.20,
              color: Colors.black45,
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Text(
                "Ative seu Bluetooth",
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: MediaQuery.of(context).size.height*0.025,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: ButtonDefault(
                textButton: "Atualizar", 
                buttonClick: buttonAtualizarClick,),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}