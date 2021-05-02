import 'dart:convert';

import 'package:flutter/material.dart';

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flutter/services.dart' show rootBundle;

import '../main.dart';

class Message {
  String date;
  String content;

  Message({this.date, this.content});

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'content': content,
    };
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    return new Message(
      date: json['date'] as String,
      content: json['content'] as String,
    );
  }
}

class ListsModel extends ChangeNotifier {
  List<Message> temp_messages = [];
  ListsModel() {}

  Future<void> insertMessage(Message msg) async {
    notifyListeners();
  }

  Future<List<Message>> getMessageList() async {
    // Get a reference to the database.
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
  }

  List<Message> get messages {
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
  }

  void add(int item) {
    notifyListeners();
  }
}
