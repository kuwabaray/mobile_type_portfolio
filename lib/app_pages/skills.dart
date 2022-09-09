import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_type_portfolio/utils.dart';

const myBlue = Color(0xFF659AD2);

class Skills extends StatelessWidget {
  static const Map<String, String> advancedSkills = {
    "Flutter":
        "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg",
    "Python":
        "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg",
    "Firebase":
        "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/firebase/firebase-plain.svg"
  };

  static const Map<String, String> intermediateSkills = {
    "Java":
        "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/java/java-original.svg",
    "C": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/c/c-original.svg",
    "Ubuntu":
        "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ubuntu/ubuntu-plain.svg",
    "ROS": "https://upload.wikimedia.org/wikipedia/commons/b/bb/Ros_logo.svg",
    "C#":
        "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/csharp/csharp-original.svg",
    "Unity":
        "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/unity/unity-original.svg",
  };

  static const Map<String, String> elementarySkills = {
    "javascript":
        "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg",
    "Django":
        "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/django/django-plain.svg",
    "Objective-C":
        "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/objectivec/objectivec-plain.svg",
    "Swift":
        "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/swift/swift-original.svg",
  };

  static const Map<String, String> languages = {
    "Japanese Native":
        "https://upload.wikimedia.org/wikipedia/commons/9/9e/Flag_of_Japan.svg",
    "English Fundamental":
        "https://upload.wikimedia.org/wikipedia/commons/a/ae/Flag_of_the_United_Kingdom.svg"
  };

  static const Map<String, String> certifications = {
    "TOEIC 905/990":
        "https://upload.wikimedia.org/wikipedia/commons/3/39/ETS_Logo.svg",
  };

  static const titles = [
    "Advanced",
    "Intermediate",
    "Elementary",
    "Language",
    "Certifications"
  ];

  final List<GlobalKey> headLineKeyList = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey()
  ];
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = getScreenHeight(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            padding: EdgeInsets.only(
              top: screenHeight * 0.04,
              left: screenHeight * 0.025,
              right: screenHeight * 0.025,
              bottom: screenHeight * 0.04,
            ),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Index(indexTitles: titles, headLineKeyList: headLineKeyList),
                  Headline(key: headLineKeyList[0], headline: "Advanced"),
                  const Divider(
                    color: myBlue,
                  ),
                  const SkillGrids(skills: advancedSkills),
                  Headline(key: headLineKeyList[1], headline: "Intermediate"),
                  const Divider(color: myBlue),
                  const SkillGrids(skills: intermediateSkills),
                  Headline(key: headLineKeyList[2], headline: "Elementary"),
                  const Divider(color: myBlue),
                  const SkillGrids(skills: elementarySkills),
                  Headline(key: headLineKeyList[3], headline: "Language"),
                  const Divider(color: myBlue),
                  const SkillGrids(skills: languages, count: 2),
                  Headline(key: headLineKeyList[4], headline: "Certifications"),
                  const Divider(color: myBlue),
                  const SkillGrids(skills: certifications, count: 2),
                ],
              ),
            )));
  }
}

class Index extends StatelessWidget {
  final List<String> indexTitles;
  final List<GlobalKey> headLineKeyList;
  Index({required this.indexTitles, required this.headLineKeyList});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double screenHeight = height * 0.9 * 10.42 / 13.84;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: myBlue),
        borderRadius: BorderRadius.circular(screenHeight * 0.01),
      ),
      padding: EdgeInsets.all(screenHeight * 0.025),
      margin: EdgeInsets.only(bottom: screenHeight * 0.0025),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: screenHeight * 0.0025),
            child: Text('Contents',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.85),
                    fontSize: screenHeight * 0.02)),
          ),
          for (var i = 0; i < indexTitles.length; i++)
            Container(
                padding: EdgeInsets.all(screenHeight * 0.005),
                child: Row(
                  children: [
                    Flexible(
                        flex: 1,
                        child: Icon(
                          Icons.fiber_manual_record,
                          color: Colors.black.withOpacity(0.85),
                          size: screenHeight * 0.01,
                        )),
                    Flexible(
                        flex: 1,
                        child: SizedBox(
                          width: screenHeight * 0.005,
                        )),
                    Flexible(
                        flex: 15,
                        child: InkWell(
                            onTap: () {
                              Scrollable.ensureVisible(
                                  headLineKeyList[i].currentContext!,
                                  duration: const Duration(milliseconds: 500));
                            },
                            child: Text(
                              indexTitles[i],
                              style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: screenHeight * 0.02),
                            ))),
                  ],
                ))
        ],
      ),
    );
  }
}

class Headline extends StatelessWidget {
  Headline({Key? key, required this.headline}) : super(key: key);
  final String headline;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double screenHeight = height * 0.9 * 10.42 / 13.84;
    return Container(
        padding: EdgeInsets.only(top: screenHeight * 0.02),
        alignment: Alignment.topLeft,
        child: Text(
          headline,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: screenHeight * 0.0275,
            color: Colors.black.withOpacity(0.85),
          ),
        ));
  }
}

class SkillGrids extends StatelessWidget {
  final Map<String, String> skills;
  final int count;

  const SkillGrids({required this.skills, this.count = 4});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double screenHeight = height * 0.9 * 10.42 / 13.84;
    List<String> skillTitles = skills.keys.toList();
    List<String> skillURLs = skills.values.toList();
    return GridView.count(
        crossAxisCount: this.count, // 1行に表示する数
        crossAxisSpacing: screenHeight * 0.01, // 縦スペース
        mainAxisSpacing: screenHeight * 0.01, // 横スペース
        shrinkWrap: true,
        childAspectRatio: 4 / this.count, //6.8/this.count,
        children: List.generate(skillTitles.length, (index) {
          return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: myBlue),
                borderRadius: BorderRadius.circular(screenHeight * 0.0075),
              ),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Flexible(
                    flex: 2,
                    child: SizedBox(
                        height: screenHeight * 0.0325,
                        width: screenHeight * 0.0325,
                        child: SvgPicture.network(
                          skillURLs[index],
                          semanticsLabel: 'SVG From Network',
                          fit: BoxFit.contain,
                        ))),
                Flexible(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.only(top: screenHeight * 0.01),
                        child: Text(
                          skillTitles[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight * 0.02,
                            color: Colors.black.withOpacity(0.85),
                          ),
                        )))
              ]));
        }));
  }
}
