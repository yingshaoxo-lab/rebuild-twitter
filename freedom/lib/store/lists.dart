import 'dart:convert';

import 'package:flutter/material.dart';

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flutter/services.dart' show rootBundle;

import 'package:freedom/classes/MyTwitter.dart';
import '../main.dart';
import '../main.dart';
import '../main.dart';

class ListsModel extends ChangeNotifier {
  List<Message> temp_messages = [];

  ListsModel() {
    myTwitter.post_tweet(new Message(date: "1", content: "hi 1"));
    myTwitter.post_tweet(new Message(date: "2", content: "hi 2"));
    myTwitter.reply_tweet(1, new Message(date: "3", content: "reply 1"));
    myTwitter.reply_tweet(1, new Message(date: "4", content: "reply 2"));
    myTwitter.reply_tweet(1, new Message(date: "5", content: "reply 3"));
    myTwitter.reply_tweet(2, new Message(date: "6", content: "reply 3"));
  }

  Future<void> insertMessage(Message msg) async {
    notifyListeners();
  }

  Future<List<Message>> getMessageList() async {
    return myTwitter.all_tweets;
    /*
    String json_string = await rootBundle.loadString('data.json');
    final parsed = jsonDecode(json_string).cast<Map<String, dynamic>>();
    //parsed.map<Message>((json) => Message.fromJson(json)).toList();

    final List<Map<String, dynamic>> maps = parsed;

    return List.generate(maps.length, (i) {
      return Message(
        date: maps[i]['date'],
        content: maps[i]['content'],
      );
    });
    */
  }

  List<Message> get messages {
    if (myTwitter.all_tweets != temp_messages) {
      temp_messages = myTwitter.all_tweets;
    }
    return temp_messages;
    /*
    getMessageList().then((listofvalues) {
      temp_messages = listofvalues;
      notifyListeners();
    }).catchError((errors) {
      temp_messages = [
        new Message(date: "1.1", content: "I love you."),
        new Message(date: "2.1", content: "I don't love you anymore.")
      ];
      notifyListeners();
    });
    return temp_messages;
    */
  }

  void add(int item) {
    notifyListeners();
  }
}
