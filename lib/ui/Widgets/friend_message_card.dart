import 'package:chatapp/ui/size_config.dart';
import 'package:chatapp/ui/style.dart';
import 'package:flutter/material.dart';

class FriendMessageCard extends StatelessWidget {
  const FriendMessageCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: 300,
        padding: EdgeInsets.all(23),
        decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
              bottomLeft: Radius.circular(28),
            )),
        child: Row(
          children: <Widget>[
            Expanded(child: Text('data')),
          ],
        ),
      ),
    );
  }
}
