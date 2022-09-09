import 'package:flutter/material.dart';
import 'package:mobile_type_portfolio/utils.dart';

class CareerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double screenHeight = height * 0.9 * 10.42 / 13.84;
    double screenWidth = screenHeight * 751 / 1334;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: screenWidth,
            height: screenHeight * 0.075,
            color: Colors.black12,
            margin: EdgeInsets.only(bottom: screenHeight * 0.025),
          ),
          Career(
            isNow: true,
            icon: Image.asset(
              "images/work.png",
              fit: BoxFit.contain,
            ),
            card: CareerCard(
              title: "Accenture",
              subTitle: "Software Engineer",
              startAt: "2022/7",
              endAt: "Now",
              place: "Tokyo Japan",
            ),
          ),
          Career(
            icon: Image.asset(
              "images/education.png",
              fit: BoxFit.contain,
            ),
            card: const CareerCard(
              title: "Tokyo University of Science",
              subTitle: "Bachelor of Information Science",
              startAt: "2018/4",
              endAt: "2022/3",
              place: "Tokyo Japan",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: screenHeight * 0.05,
                    height: screenHeight * 0.05,
                    child: Image.asset(
                      "images/user.png",
                      fit: BoxFit.contain,
                    ),
                  )),
              Flexible(
                  flex: 13,
                  child: SizedBox(
                    width: screenWidth * 0.775,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class Career extends StatelessWidget {
  final Widget icon;
  final CareerCard card;
  final bool isNow;
  Career({required this.icon, required this.card, this.isNow = false});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double screenHeight = height * 0.9 * 10.42 / 13.84;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
            flex: 1,
            child: Column(
              children: <Widget>[
                Container(
                  width: screenHeight * 0.0025,
                  height: screenHeight * 0.11,
                  color: !isNow ? Colors.black12 : Colors.transparent,
                ),
                Container(
                  width: screenHeight * 0.05,
                  height: screenHeight * 0.05,
                  child: this.icon,
                ),
                Container(
                  width: screenHeight * 0.0025,
                  height: screenHeight * 0.11,
                  color: Colors.black12,
                ),
              ],
            )),
        Flexible(flex: 5, child: card)
      ],
    );
  }
}

class CareerCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String startAt;
  final String endAt;
  final String place;

  const CareerCard(
      {required this.title,
      required this.subTitle,
      required this.startAt,
      required this.endAt,
      required this.place});

  @override
  Widget build(BuildContext context) {
    double screenHeight = getScreenHeight(context);
    double screenWidth = getScreenWidth(context);
    return Container(
      padding: EdgeInsets.only(
          top: screenHeight * 0.0225, bottom: screenHeight * 0.0225),
      child: Card(
          elevation: screenHeight * 0.005,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenHeight * 0.01),
          ),
          child: Container(
            height: screenHeight * 0.2,
            width: screenWidth * 0.75,
            padding: EdgeInsets.only(
              left: screenWidth * 0.035,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    flex: 2,
                    child: Container(
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.03,
                        ),
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.85),
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * 0.0275),
                        ))),
                Flexible(
                    child: Container(
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.0075,
                        ),
                        child: Text(
                          subTitle,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.85),
                              fontWeight: FontWeight.normal,
                              fontSize: screenHeight * 0.02),
                        ))),
                Flexible(
                    child: Container(
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.02,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                                flex: 3,
                                child: Icon(
                                  Icons.calendar_month,
                                  color: Colors.black38,
                                  size: screenHeight * 0.025,
                                )),
                            Flexible(
                              flex: 2,
                              child: SizedBox(
                                width: screenWidth * 0.02,
                              ),
                            ),
                            Flexible(
                                flex: 20,
                                child: Text(
                                  startAt + ' ~ ' + endAt,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontWeight: FontWeight.normal,
                                      fontSize: screenHeight * 0.02),
                                ))
                          ],
                        ))),
                Flexible(
                    child: Container(
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.01,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                                child: Icon(
                              Icons.place,
                              color: Colors.black38,
                              size: screenHeight * 0.025,
                            )),
                            Flexible(
                                child: SizedBox(
                              width: screenWidth * 0.02,
                            )),
                            Flexible(
                                child: Text(
                              place,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.normal,
                                  fontSize: screenHeight * 0.02),
                            ))
                          ],
                        )))
              ],
            ),
          )),
    );
  }
}
