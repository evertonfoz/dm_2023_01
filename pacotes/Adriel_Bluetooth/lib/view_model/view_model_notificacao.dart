import 'package:automacaoresidencial/model/model_agendamento.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

class ViewModelNotificacao{

  Future<void> configureNotification(ModAgendamento modAgendamento) async {

    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

     WidgetsFlutterBinding.ensureInitialized();

    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings();

    final InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS,);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    var androidDetails = new AndroidNotificationDetails("Id Teste","Nome","Sobrenome", importance: Importance.max, priority: Priority.max);
    var iosDetails = new IOSNotificationDetails();
    var geraNotificacao = new NotificationDetails(android: androidDetails, iOS: iosDetails);

    
    flutterLocalNotificationsPlugin.cancelAll();
    
    flutterLocalNotificationsPlugin.show(1, "${modAgendamento.nomeAgendamento}", "Agendamento criado", geraNotificacao);
    
        // ignore: deprecated_member_use
    flutterLocalNotificationsPlugin.schedule(
      2, 
      "${modAgendamento.nomeAgendamento}", 
      " ${modAgendamento.nomeAgendamento} será ativado agora ${format(modAgendamento.inicioAgendamento, false)} e terminará ${format(modAgendamento.fimAgendamento, false)}", 
      DateTime.parse(modAgendamento.inicioAgendamento), 
      geraNotificacao, 
      androidAllowWhileIdle : true
    );

    // ignore: deprecated_member_use
    flutterLocalNotificationsPlugin.schedule(
      3, 
      "${modAgendamento.nomeAgendamento}", 
      " ${modAgendamento.nomeAgendamento} será desativado agora ${format(modAgendamento.fimAgendamento, false)}", 
      DateTime.parse(modAgendamento.fimAgendamento), 
      geraNotificacao, 
      androidAllowWhileIdle : true
    );
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