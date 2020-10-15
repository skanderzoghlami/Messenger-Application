import 'package:chatapp/ui/size_config.dart';
import 'package:chatapp/ui/style.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function onTap;
  final Widget child;
  const PrimaryButton({Key key, this.onTap, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizental * 6),
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizental * 6,
                vertical: SizeConfig.blockSizeHorizental * 4),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: Style.gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(25)),
            child: child));
  }
}
