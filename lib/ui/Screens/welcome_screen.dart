import 'package:chatapp/ui/Screens/login_screen.dart';
import 'package:chatapp/ui/Screens/register_screen.dart';
import 'package:chatapp/ui/Widgets/primary_button.dart';
import 'package:chatapp/ui/size_config.dart';
import 'package:chatapp/ui/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static final routeName = 'welcome';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Style.darkColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text('Welcome to GOSIP', style: Style.appNameTextStyle),
            ),
          ),
          Center(
            child: Text(
              "the place where you can safely ",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              "talk about people behind their backs !",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
              width: SizeConfig.screenWidth / 2,
              height: SizeConfig.screenHeight / 2,
              child: Image.asset('assets/images/gossip.png')),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PrimaryButton(
                    child: Center(
                        child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    )),
                    onTap: () => Navigator.of(context)
                        .pushNamed(SignUpScreen.routeName)),
                SizedBox(
                  height: SizeConfig.blockSizeHorizental * 2,
                ),
                PrimaryButton(
                  child: Center(
                      child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  )),
                  onTap: () =>
                      Navigator.of(context).pushNamed(LoginScreen.routeName),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
