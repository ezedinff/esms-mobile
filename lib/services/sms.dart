import 'package:esms/services/db.dart';
import 'package:flutter/cupertino.dart';
import 'package:sms/sms.dart';
import 'package:esms/models/models.dart';
import 'package:esms/services/globals.dart';
void sendMessage(Message m) {
  SmsSender sender = new SmsSender();
  SmsMessage message = new SmsMessage(m.to, m.text);
  message.onStateChanged.listen((state) async {
  if (state == SmsMessageState.Sent) {
  print("SMS is sent!");
  } else if (state == SmsMessageState.Delivered) {
  print("SMS is delivered!");
      var doc = Document<Message>(path: '/messages/${m.id}');
      var data = {
        "id": m.id,
        "to": m.to,
        "text": m.text,
        "apiKey": m.apiKey,
        "status": 1
      };
      doc.upsert(data);
  }
  });
  sender.sendSms(message);
}


void processMessages(List<Message> messages) {
  for(var message in messages) {
    //print(message.text);
    sendMessage(message);
  }
}
