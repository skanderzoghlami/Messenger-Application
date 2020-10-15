import 'package:chatapp/providers/auth_provider.dart';
import 'package:chatapp/ui/Screens/main_screen.dart';
import 'package:chatapp/ui/Widgets/primary_button.dart';
import 'package:chatapp/ui/size_config.dart';
import 'package:chatapp/ui/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static final routeName = 'sign_up';
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _key = GlobalKey<FormState>();
  TextEditingController _password = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _name = new TextEditingController();
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthProvider>(context);
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Style.darkColor,
        body: ListView(
          children: <Widget>[
            SizedBox(height: SizeConfig.screenHeight * 0.1),
            Center(
              child: Text('Gosip', style: Style.appNameTextStyle),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.1),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizental * 4),
              child: Form(
                  key: _key,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                          controller: _name,
                          onSaved: (v) {
                            provider.user.name = v.trim();
                          },
                          decoration: Style.inputDecoration('Full name'),
                          validator: (v) {
                            if (v.isEmpty) {
                              return 'this field is required';
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(height: SizeConfig.blockSizeVertical * 2),
                      TextFormField(
                          controller: _email,
                          onSaved: (v) {
                            provider.user.email = v.trim();
                          },
                          decoration: Style.inputDecoration('Email'),
                          validator: (v) {
                            if (v.isEmpty) {
                              return 'this field is required';
                            } else if (false) {
                              return 'e-mail is not valid';
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(height: SizeConfig.blockSizeVertical * 2),
                      TextFormField(
                          controller: _password,
                          onSaved: (v) {
                            provider.user.password = v;
                          },
                          obscureText: true,
                          decoration: Style.inputDecoration('Password'),
                          validator: (v) {
                            if (v.isEmpty) {
                              return 'this field is required';
                            } else if (v.trim().length < 6) {
                              return 'password too short';
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(height: SizeConfig.blockSizeVertical * 2),
                      TextFormField(
                          onSaved: (v) {
                            //
                          },
                          obscureText: true,
                          decoration: Style.inputDecoration('Password confirm'),
                          validator: (v) {
                            if (v.isEmpty) {
                              return 'this field is required';
                            } else if (v.trim() != _password.text.trim()) {
                              return "passwords doesnt match ";
                            } else {
                              return null;
                            }
                          }),
                    ],
                  )),
            )
          ],
        ),
        bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: PrimaryButton(
                child: Text(
                  'save',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32),
                ),
                onTap: () async {
                  if (_key.currentState.validate()) {
                    print('isValidate');
                    var result = await provider.register(
                        _email.text, _password.text.trim(), _name.text.trim());
                    if (result) {
                      print('done');
                      Navigator.of(context)
                          .pushReplacementNamed(MainScreen.routeName);
                    } else {
                      print('error');
                    }
                  } else {
                    print('not validate');
                  }
                  print('done');
                })));
  }
}
