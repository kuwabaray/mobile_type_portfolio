import 'package:flutter/material.dart';
import 'package:mobile_type_portfolio/utils.dart';
import 'package:url_launcher/url_launcher.dart' deferred as urlLauncher;

class Credit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = getScreenHeight(context);
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.075),
        body: Container(
          margin: EdgeInsets.all(screenHeight * 0.04),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  child: Container(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.025),
                      child: Text(
                        "Resource Credits",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.85),
                            fontSize: screenHeight * 0.025,
                            fontWeight: FontWeight.bold),
                      ))),
              Flexible(
                  child: const CreditItem(
                      text: "created by Ilham Fitrotul Hayat - Flaticon",
                      img: "images/mail.png",
                      url:
                          "https://www.flaticon.com/authors/ilham-fitrotul-hayat")),
              Flexible(
                  child: const CreditItem(
                      text: "created by Kiranshastry - Flaticon",
                      img: "images/skills.png",
                      url: "https://www.flaticon.com/authors/kiranshastry")),
              Flexible(
                  child: const CreditItem(
                      text: "created by Icon8",
                      img: "images/location.png",
                      url: "https://icons8.com")),
              Flexible(
                  child: const CreditItem(
                      text: "created by Freepik - Flaticon",
                      img: "images/work.png",
                      url: "https://www.flaticon.com/authors/freepik")),
              Flexible(
                  child: const CreditItem(
                      text: "created by Freepik - Flaticon",
                      img: "images/education.png",
                      url: "https://www.flaticon.com/authors/freepik")),
              Flexible(
                  child: const CreditItem(
                      text: "created by Freepik - Flaticon",
                      img: "images/blog.png",
                      url: "https://www.flaticon.com/authors/freepik")),
              Flexible(
                  child: const CreditItem(
                      text: "created by Smashicons - Flaticon",
                      img: "images/user.png",
                      url: "https://www.flaticon.com/authors/smashicons")),
              Flexible(
                  child: const CreditItem(
                      text: "created by Good Ware - Flaticon",
                      img: "images/copyright.png",
                      url: "https://www.flaticon.com/authors/good-ware")),
            ],
          ),
        ));
  }
}

class CreditItem extends StatelessWidget {
  final String text;
  final String img;
  final String url;

  const CreditItem({required this.text, required this.img, required this.url});

  @override
  Widget build(BuildContext context) {
    double screenHeight = getScreenHeight(context);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
          top: screenHeight * 0.015,
          left: screenHeight * 0.02,
          bottom: screenHeight * 0.015),
      child: Row(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(right: screenHeight * 0.02),
                width: screenHeight * 0.05,
                height: screenHeight * 0.05,
                child: Image.asset(
                  img,
                  fit: BoxFit.contain,
                ),
              )),
          Flexible(
              flex: 6,
              child: InkWell(
                  onTap: () async {
                    await urlLauncher.loadLibrary();
                    final Uri uri = Uri.parse(url);
                    if (await urlLauncher.canLaunchUrl(uri)) {
                      await urlLauncher.launchUrl(uri);
                    }
                  },
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: screenHeight * 0.02,
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  )))
        ],
      ),
    );
  }
}
