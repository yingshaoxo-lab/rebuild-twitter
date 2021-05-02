class Message {
  int id;
  String type;
  String date;
  String content;
  List<int> children = [];

  Message({this.type, this.date, this.content});

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

class MyTwitter {
  List<Message> all_tweets = [];
  int id_ = 0;

  Message post_tweet(Message msg, {String type = "post"}) {
    this.id_ += 1;
    msg.id = this.id_;
    msg.type = type;
    this.all_tweets.add(msg);
    return msg;
  }

  void reply_tweet(int tweet_id_you_reply_to, Message msg) {
    for (int i = 0; i < this.all_tweets.length; i++) {
      if (this.all_tweets[i].id == tweet_id_you_reply_to) {
        Message new_msg = this.post_tweet(msg, type: "reply");
        this.all_tweets[i].children.add(new_msg.id);
      }
    }
  }

  Message get_tweet(int tweet_id) {
    for (int i = 0; i < this.all_tweets.length; i++) {
      if (this.all_tweets[i].id == tweet_id) {
        return this.all_tweets[i];
      }
    }
  }
}
