import 'package:automacaoresidencial/view/view_home/lista_dispositivos.dart';
import 'package:automacaoresidencial/view/view_home/splash_scream.dart';
import 'package:automacaoresidencial/view_model/view_model_bluetooth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import 'bar_home.dart';
import 'bluetooth_desativado.dart';

class ViewHome extends StatefulWidget {

  @override
  _ViewHomeState createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {

   //Obtém uma instância do bluetooth
  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;

  //Defina algumas variáveis, que serão necessárias posteriormente
  List<BluetoothDevice> devicesList = [];
  bool bluetoothDispositivoStatus = true;

  ViewModelBluetooth viewModelBluetooth = new ViewModelBluetooth();





  Future<void> getDadosDeInicializacao() async {
    await bluetoothConnectionState();
    await buletoothDispositivoConnect();
    // Pegar os dados do banco necessarios
    await Future.delayed(Duration(milliseconds: 500));
  }

  Future<void> bluetoothConnectionState() async {
    await viewModelBluetooth.bluetoothConnectionState(bluetooth).then((value) => {
        devicesList = value
    });
  }

  Future<void> buletoothDispositivoConnect() async {
    await viewModelBluetooth.statusBluetoothSmatphoneAtivo(bluetooth).then((value) => {
      bluetoothDispositivoStatus = value
    });

  }

  restarHomePage(bool value){
    setState(() { });
  }





  @override
  Widget build(BuildContext context) {
     return FutureBuilder(
      future: getDadosDeInicializacao(),
      builder: (context, future) {
        if (future.connectionState == ConnectionState.waiting) {
          return SplashScream();
        } 
        else {
           if(!bluetoothDispositivoStatus){
          return BluetoothDesativado(bluetoothGET: bluetooth, restarHomePage: restarHomePage,);

          } else{ 
            return Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,

                child: Column(
                  children: <Widget>[
                    BarHome(),

                    Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: PhysicalModel(
                        child: Padding(padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                          child:Text(
                            "Dispositivos Emparelhados",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        color: Colors.black38,
                        elevation: 10,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    
                    if(devicesList != null)
                    Expanded(
                      child: ListaDispositivos(listDevices: devicesList, bluetoothSerial: bluetooth, restarHomePage: restarHomePage,)
                    )
                    else
                    Expanded(
                      child: Padding(padding: EdgeInsets.fromLTRB(0, 30, 10, 0),
                        child:Text(
                          "Nenhum dispositivo encontrado",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            color: Colors.red,
                            //fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        }
      },
    );
  }
}