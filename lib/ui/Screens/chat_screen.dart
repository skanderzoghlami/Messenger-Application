import 'package:chatapp/ui/Widgets/friend_message_card.dart';
import 'package:chatapp/ui/Widgets/my_message_card.dart';
import 'package:chatapp/ui/size_config.dart';
import 'package:chatapp/ui/style.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    // this is used to pervent the app from going to the back before the screen is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });

    _scrollController = ScrollController();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop()),
        title: Text('Friend name'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: ListView(
              controller: _scrollController,
              // reverse is used to invert the data
              reverse: true,
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockhorizental * 3,
                  vertical: SizeConfig.safeBlockVertical * 3),
              children: <Widget>[
                MyMessageCard(),
                FriendMessageCard(),
                MyMessageCard(),
                FriendMessageCard(),
                MyMessageCard(),
                FriendMessageCard(),
                MyMessageCard(),
                FriendMessageCard(),
                MyMessageCard(),
                FriendMessageCard(),
                MyMessageCard(),
                FriendMessageCard(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Style.darkColor,
                borderRadius: BorderRadius.circular(32)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type your message ...',
                      hintStyle: TextStyle()),
                )),
                Container(
                  child: Icon(Icons.send),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors: [
                            Style.primaryColor,
                            Style.secondaryColor,
                            Style.secondaryColor,
                            Style.secondaryColor
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
