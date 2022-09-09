import 'package:flutter/material.dart';
import 'package:mobile_type_portfolio/screen.dart' deferred as screen;

class TopPage extends StatelessWidget {
  static const iphoneImage = "images/mockup.png";

  late Future<void> _screenFuture;
  Widget? _screenWidget;

  TopPage() {
    _screenFuture = screen.loadLibrary().then((value) {
      _screenWidget = screen.Screen();
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "images/background.jpg",
              ),
              fit: BoxFit.fill),
        ),
        child: Center(
          child: Container(
              margin:
                  EdgeInsets.only(top: height * 0.05, bottom: height * 0.05),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(iphoneImage),
                  FutureBuilder<void>(
                    future: _screenFuture,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (_screenWidget != null) {
                        return _screenWidget!;
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  )
                ],
              )),
        ));
  }
}
