import 'package:chatapp/providers/locator.dart';
import 'package:chatapp/providers/provider_setup.dart';
import 'package:chatapp/ui/Screens/login_screen.dart';
import 'package:chatapp/ui/Screens/main_screen.dart';
import 'package:chatapp/ui/Screens/register_screen.dart';
import 'package:chatapp/ui/Screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // this is to create instancs of the conversationPRovider
  setuplocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: provider, child: StartApp());
  }
}

class StartApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'welcome',
      routes: {
        'main': (context) => MainScreen(),
        'welcome': (context) => WelcomeScreen(),
        'sign_up': (context) => SignUpScreen(),
        'sign_in': (context) => LoginScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //we are going to use builder here to avoid the context exception
      //since the parent of this widget isn't a materialApp
    );
  }
}
