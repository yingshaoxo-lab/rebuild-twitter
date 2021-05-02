import 'package:flutter/material.dart';

import 'package:freedom/classes/MyTwitter.dart';
import 'package:freedom/components/card.dart';
import 'package:freedom/components/lists.dart';

import '../main.dart';

class Tweet extends StatefulWidget {
  Message message;

  Tweet({Key key, this.message}) : super(key: key);

  @override
  _TweetState createState() => _TweetState();
}

class _TweetState extends State<Tweet> {
  @override
  Widget build(BuildContext context) {
    Message message = this.widget.message;

    return Container(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true, // Used for removing back buttoon.
          backgroundColor: Colors.white, // status bar color
          iconTheme: IconThemeData(color: Colors.blue),
          brightness: Brightness.light, // status bar brightness
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                MyCard(
                  message: message,
                ),
                Expanded(
                    child: MyList(
                  messages: message.children
                      .map((e) => myTwitter.get_tweet(e))
                      .toList(),
                  type: "reply",
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
