import 'package:automacaoresidencial/model/model_agendamento.dart';
import 'package:flutter/material.dart';


void loadinSendAndSaveConnect(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Salvando e Enviando Aguarde!",
          style: TextStyle(
            color: Colors.brown,
          ),
        ),
        actions: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.15,
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.black87),
            ),
          ),
        ],
        elevation: 24,
        backgroundColor: Colors.white,
      ),
    );
  }

void falha(String tittle, String text, BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          tittle,
          style: TextStyle(
            color: Colors.brown,
          ),
        ),
        content: Text(
          text,
          style: TextStyle(
            color: Colors.brown,
          ),
        ),
        actions: <Widget>[
          Container(
            alignment: Alignment.bottomRight,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.15,
            child: TextButton(
              onPressed: (){Navigator.pop(context);},
              child: Text("OK",
                style: TextStyle(
                  color: Colors.brown,
                ),
              ),
              style: TextButton.styleFrom(primary: Colors.lightBlueAccent),
            )
          ),
        ],
        elevation: 24,
        backgroundColor: Colors.white,
      ),
    );
  }

void loadinConnect(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Conectando Aguarde!", 
          style: TextStyle(
            color: Colors.brown
          ),
        ),
          actions: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.15,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.brown),
              ),
            ),
          ],
        elevation: 24,
        backgroundColor: Colors.white,
      ),
    );
  }

void dialogAgendamento(String tittle, String text, BuildContext context, Function selectYes, ModAgendamento modAgendamento){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          tittle,
          style: TextStyle(
            color: Colors.brown,
          ),
        ),
        content: Text(
          text,
          style: TextStyle(
            color: Colors.brown,
          ),
        ),
        actions: <Widget>[
          Container(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: (){selectYes(modAgendamento); Navigator.pop(context);},
              child: Text("Sim",
                style: TextStyle(
                  color: Colors.brown,
                ),
              ),
              style: TextButton.styleFrom(primary: Colors.lightBlueAccent),
            )
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: (){Navigator.pop(context);},
              child: Text("Não",
                style: TextStyle(
                  color: Colors.brown,
                ),
              ),
              style: TextButton.styleFrom(primary: Colors.lightBlueAccent),
            )
          ),
        ],
        elevation: 24,
        backgroundColor: Colors.white,
      ),
  );
}
