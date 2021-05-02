import 'package:flutter/material.dart';
import 'package:freedom/store/lists.dart';
import 'package:provider/provider.dart';
import 'card.dart';

import 'package:freedom/classes/MyTwitter.dart';

class MyList extends StatelessWidget {
  List<Message> messages;
  String type;

  MyList({this.messages, this.type}) {
    messages = messages.where((element) => element.type == type).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.grey, style: BorderStyle.solid, width: 0.3))),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          thickness: 0.4,
          color: Colors.grey,
        ),
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(child: MyCard(message: messages[index]));
        },
      ),
    );
  }
}

/*
class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListsModel>(builder: (context, listsModel, child) {

      return Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Colors.grey, style: BorderStyle.solid, width: 0.3))),
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            thickness: 0.4,
            color: Colors.grey,
          ),
          itemCount: listsModel.messages.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(child: MyCard(message: listsModel.messages[index]));
          },
        ),
      );

    });
  }
}
*/
