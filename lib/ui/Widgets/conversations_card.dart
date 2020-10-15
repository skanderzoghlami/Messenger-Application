import 'package:chatapp/models/conversation_model.dart';
import 'package:flutter/material.dart';

class ConversationsCard extends StatelessWidget {
  final Function onTap;
  final ConversationModel conversation;
  const ConversationsCard({Key key, this.onTap, this.conversation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
            "https://via.placeholder.com/400x400.png?text=" +
                conversation.user2.name[0]),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            conversation.user2.name,
            style: TextStyle(fontSize: 18),
          ),
          Text(
            '21:15',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
      subtitle: conversation.messages.length != 0
          ? Text(conversation.messages.last.body)
          : Text('Say hello to your new friend'),
    );
  }
}
