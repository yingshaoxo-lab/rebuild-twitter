// Import the test package and Counter class
import 'dart:developer';

import 'package:test/test.dart';
import 'package:flutter/foundation.dart';

import '../lib/classes/MyTwitter.dart';

void main() {
  test('test1', () {
    final myTwitter = MyTwitter();

    expect(myTwitter.all_tweets.length, 0);

    myTwitter.post_tweet(new Message(date: "123", content: "hi"));

    expect(myTwitter.all_tweets.length, 1);

    expect(myTwitter.get_tweet(1).content, "hi");

    debugPrint("${myTwitter.all_tweets}");
  });
}
