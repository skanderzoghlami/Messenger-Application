import 'package:chatapp/ui/size_config.dart';
import 'package:chatapp/ui/style.dart';
import 'package:flutter/material.dart';

class MyMessageCard extends StatelessWidget {
  const MyMessageCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/originals/0c/b3/f5/0cb3f53d72facf7a144c80da5ae254a5.jpg'),
          ),
          SizedBox(
            width: 12,
          ),
          Container(
            width: 300,
            padding: EdgeInsets.all(23),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Style.primaryColor,
                  Style.secondaryColor,
                  Style.secondaryColor,
                  Style.secondaryColor
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                )),
            child: Row(
              children: <Widget>[
                Expanded(child: Text('data')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
