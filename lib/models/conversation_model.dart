import 'dart:convert';

class ConversationModel {
  int id;
  User user;
  User user2;
  String createdAt;
  List<Messages> messages;

  ConversationModel(
      {this.id, this.user, this.user2, this.createdAt, this.messages});

  ConversationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    user = json['user_1'] != null ? new User.fromJson(json['user_1'][0]) : null;
    user2 =
        json['user_2'] != null ? new User.fromJson(json['user_2'][0]) : null;
    createdAt = json['createdAt'];
    if (json['messages'] != null) {
      messages = new List<Messages>();
      json['messages'].forEach((v) {
        messages.add(new Messages.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['created_at'] = this.createdAt;
    if (this.messages != null) {
      data['messages'] = this.messages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int id;
  String name;
  String email;
  String password;
  var picture;

  User({this.id, this.name, this.email, this.picture, this.password});
  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    picture = json['picture'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['picture'] = this.picture;
    return data;
  }
}

class Messages {
  int id;
  String body;
  int read;
  Messages({this.id, this.body, this.read});
  Messages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    read = json['read'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['body'] = this.body;
    data['read'] = this.read;
    return data;
  }
}
