
import 'package:esms/services/sms.dart';
import 'package:esms/shared/item_card.dart';
import 'package:esms/shared/loader.dart';
import 'package:flutter/material.dart';
import 'package:esms/services/services.dart';
import 'package:esms/models/models.dart';
var orange = Color(0xFFfc9f6a);
var pink = Color(0xFFee528c);
var blue = Color(0xFF8bccd6);
var darkBlue = Color(0xFF60a0d7);
var valueBlue = Color(0xFF5fa0d6);
// #5F0A87 #A4508B
var g1 = [Color(0xff5F0A87), Color(0xffA4508B)];
var g2 = [orange, pink];
var g3 =  [blue, darkBlue];
class Overview extends StatelessWidget {
  List<Widget> getBoards(List<List<Message>> messages) {
    return [
      ItemCard('Success', 'sms', messages[0].length.toString(), g1),
      ItemCard('Failed', 'sms', messages[1].length.toString(), g2),
      ItemCard('Waiting', 'sms', messages[2].length.toString(), g3),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getMessages(),
        builder: (BuildContext context, AsyncSnapshot snap) {
            if(snap.hasData) {
              var cards = getBoards(snap.data);
              processMessages(snap.data[2]);
              return ListView.builder(
                itemCount: cards.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return cards[index];
                  }
              );
            } else {
              return LoadingScreen();
            }
        });
  }
  getMessages() async {
     var messages = await Global.messageRef.getData();
    // Global.projectTableRef.getList();
     return [
       messages.where((element) => element.status == 1).toList(),
       messages.where((element) => element.status == 2).toList(),
       messages.where((element) => element.status == 3).toList(),
     ];
  }
}
