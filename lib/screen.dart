import 'package:flutter/material.dart';
import 'package:mobile_type_portfolio/app_pages/base.dart';
import 'package:mobile_type_portfolio/app_pages/career.dart' deferred as career;
import 'package:mobile_type_portfolio/app_pages/credit.dart' deferred as credit;
import 'package:mobile_type_portfolio/icon_base.dart';
import 'package:mobile_type_portfolio/app_pages/location.dart'
    deferred as location;
import 'package:mobile_type_portfolio/app_pages/skills.dart' deferred as skill;
import 'package:mobile_type_portfolio/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart' deferred as urlLauncher;

import 'dart:ui';

class Screen extends StatelessWidget {
  late Future<void> _skillFuture;
  late Future<void> _careerFuture;
  late Future<void> _creditFuture;
  late Future<void> _locationFuture;
  Widget? _skills;
  Widget? _career;
  Widget? _credit;
  Widget? _location;
  Widget _github = IconBase.url(
      title: "GitHub",
      backgroundColor: Colors.black,
      icon: Image.asset(
        "images/GitHub_white.png",
        fit: BoxFit.contain,
      ),
      url: 'https://github.com/kuwabaray');
  Widget _blog = IconBase.url(
      title: "Blog",
      backgroundColor: Colors.transparent,
      isPadding: false,
      icon: Image.asset(
        "images/blog.png",
        fit: BoxFit.contain,
      ),
      url: 'https://kuwabaray.hatenablog.com/archive');
  Widget _linkedin = IconBase.url(
      title: "LinkedIn",
      backgroundColor: Colors.transparent,
      isPadding: false,
      icon: Image.asset(
        "images/linkedin.png",
        fit: BoxFit.contain,
      ),
      url: 'https://www.linkedin.com/in/ykuwabara');

  Screen() {
    _skillFuture = skill.loadLibrary().then((value) {
      _skills = IconBase.launchApp(
          title: "Skills",
          backgroundColor: Colors.transparent,
          isPadding: false,
          icon: Image.asset(
            "images/skills.png",
            fit: BoxFit.contain,
          ),
          app: AppPageBase(title: "Skills", child: skill.Skills()));
    });
    _careerFuture = career.loadLibrary().then((value) {
      _career = IconBase.launchApp(
        title: "Career",
        backgroundColor: Color(0xFFD7DEE4),
        icon: Image.asset(
          "images/work.png",
          fit: BoxFit.contain,
        ),
        app: AppPageBase(title: "Career", child: career.CareerPage()),
      );
    });
    _creditFuture = credit.loadLibrary().then((value) {
      _credit = IconBase.launchApp(
        title: "Credit",
        backgroundColor: Colors.white,
        icon: Image.asset(
          "images/copyright.png",
          fit: BoxFit.contain,
        ),
        app: AppPageBase(
          title: "Credit",
          child: credit.Credit(),
        ),
      );
    });
    _locationFuture = location.loadLibrary().then((value) {
      _location = IconBase.launchApp(
        title: "Location",
        backgroundColor: Colors.white,
        icon: Image.asset(
          "images/location.png",
          fit: BoxFit.contain,
        ),
        app: AppPageBase(
          title: "Location",
          child: location.LocationApp(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double screenHeight = getScreenHeight(context);
    double screenWidth = getScreenWidth(context);
    return Center(
        child: Stack(children: [
      Container(
          height: screenHeight,
          width: screenWidth,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
                padding: EdgeInsets.only(
                  left: screenHeight * 0.0125,
                  top: screenHeight * 0.01,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.account_circle_outlined,
                      size: screenWidth * 0.0375,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: screenWidth * 0.005,
                    ),
                    Text(
                      "Yukiya Kuwabara",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.w100,
                          decoration: TextDecoration.none),
                    )
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(top: height * 0.015),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FutureBuilder<void>(
                        future: _creditFuture,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (_credit != null) {
                            return _credit!;
                          } else {
                            return Container();
                          }
                        }),
                    _github,
                    FutureBuilder<void>(
                        future: _skillFuture,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (_skills != null) {
                            return _skills!;
                          } else {
                            return Container();
                          }
                        }),
                    IconBase(
                      title: "E-Mail",
                      backgroundColor: Colors.white,
                      icon: Image.asset(
                        "images/mail.png",
                        fit: BoxFit.contain,
                      ),
                      func: () {
                        showDialog(
                            context: context,
                            barrierColor: Colors.transparent,
                            builder: (_) => Center(
                                child: Container(
                                    height: screenHeight,
                                    width: screenWidth,
                                    child: CupertinoAlertDialog(
                                      title: Text(
                                        "Write an email ?",
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.05),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("Would you write an email to ",
                                              style: TextStyle(
                                                  fontSize:
                                                      screenWidth * 0.0425)),
                                          SelectableText(
                                              "ykuwabara.ac@gmail.com ?",
                                              style: TextStyle(
                                                  fontSize:
                                                      screenWidth * 0.0425,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      actions: [
                                        CupertinoDialogAction(
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  fontSize: screenWidth * 0.05),
                                            ),
                                            isDestructiveAction: true,
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            }),
                                        CupertinoDialogAction(
                                          child: Text(
                                            'Yes',
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.05),
                                          ),
                                          onPressed: () async {
                                            await urlLauncher.loadLibrary();
                                            final Uri url = Uri.parse(
                                                "mailto:ykuwabara.ac@gmail.com");
                                            if (await urlLauncher
                                                .canLaunchUrl(url)) {
                                              await urlLauncher.launchUrl(url);
                                            }
                                          },
                                        )
                                      ],
                                    ))));
                      },
                    ),
                    //メールアドレス
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(top: height * 0.035),
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _blog,
                      FutureBuilder<void>(
                          future: _careerFuture,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (_career != null) {
                              return _career!;
                            } else {
                              return Container();
                            }
                          }),
                      FutureBuilder<void>(
                          future: _locationFuture,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (_location != null) {
                              return _location!;
                            } else {
                              return Container();
                            }
                          }),
                      _linkedin
                    ])),
          ])),
      Positioned(
        bottom: screenHeight * 0,
        left: screenWidth * 0.006,
        child: Container(
          height: screenHeight * 0.14,
          width: screenWidth * 0.999,
          child: ClipRect(
              child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: screenHeight * 0.001,
              sigmaY: screenHeight * 0.001,
            ),
            child: Container(
              color: Colors.black.withOpacity(0.1),
            ),
          )),
        ),
      )
    ]));
  }
}
