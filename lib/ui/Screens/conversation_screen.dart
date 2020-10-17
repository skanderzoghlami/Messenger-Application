import 'package:chatapp/providers/auth_provider.dart';
import 'package:chatapp/ui/Screens/chat_screen.dart';
import 'package:chatapp/ui/Screens/welcome_screen.dart';
import 'package:chatapp/ui/Widgets/conversations_card.dart';
import 'package:chatapp/ui/size_config.dart';
import 'package:chatapp/ui/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chatapp/providers/conversations_provider.dart';

class ConversationsScreen extends StatefulWidget {
  ConversationsScreen({Key key}) : super(key: key);

  @override
  _ConversationsScreenState createState() => _ConversationsScreenState();
}

class _ConversationsScreenState extends State<ConversationsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ConversationsProvider>(context).getConversations();
    });
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var provider = Provider.of<ConversationsProvider>(context);
    return Scaffold(
      backgroundColor: Style.darkColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Conversations'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {
            Provider.of<AuthProvider>(context).logout();
            Navigator.of(context).pushNamedAndRemoveUntil(
                WelcomeScreen.routeName, (Route<dynamic> route) => false);
          },
          icon: Icon(Icons.time_to_leave),
        ),
      ),
      body: Center(
          child: provider.busy
              ? CircularProgressIndicator()
              : ListView.builder(
                  padding:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
                  itemCount: provider.conversations.length,
                  itemBuilder: (context, index) {
                    return ConversationsCard(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => ChatScreen())),
                        conversation: provider.conversations[index]);
                  },
                )),
    );
  }
}
