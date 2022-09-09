import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile_type_portfolio/utils.dart';

class AppPageBase extends StatelessWidget {
  final String title;
  final Widget child;

  AppPageBase({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double screenHeight = getScreenHeight(context);
    double screenWidth = getScreenWidth(context);
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
        height: height * 0.0825,
      ),
      Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: screenHeight * 0.002),
          child: Hero(
            tag: title,
            child: Container(
                height: screenHeight,
                width: screenWidth,
                color: Colors.white,
                child: this.child),
          )),
      Container(
        margin: EdgeInsets.only(top: height * 0.0175),
        child: SizedBox(
          height: height * 0.065,
          width: height * 0.065,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            backgroundColor: Colors.transparent,
            elevation: 0, // 通常時のエレベーション
            hoverElevation: 0, // マウスホバー時のエレベーション
            highlightElevation: 0, // ボタン押下時のエレベーション
          ),
        ),
      )
    ]);
  }
}
