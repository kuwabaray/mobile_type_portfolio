import 'package:flutter/material.dart';
import 'package:mobile_type_portfolio/utils.dart';
import 'package:url_launcher/url_launcher.dart' deferred as urlLauncher;

class IconBase extends StatefulWidget {
  final String title;
  final Color backgroundColor;
  final Widget icon;
  Widget? app;
  String? url;
  Function()? func;
  final bool isPadding;

  IconBase(
      {super.key,
      required this.title,
      required this.backgroundColor,
      required this.icon,
      required this.func,
      this.isPadding = true});

  IconBase.launchApp(
      {super.key,
      required this.title,
      required this.backgroundColor,
      required this.icon,
      required this.app,
      this.isPadding = true});

  IconBase.url(
      {super.key,
      required this.title,
      required this.backgroundColor,
      required this.icon,
      required this.url,
      this.isPadding = true});

  @override
  State<IconBase> createState() => IconBaseState();
}

class IconBaseState extends State<IconBase> {
  Color overlayColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    double size = getScreenWidth(context) * 0.1575;
    return Column(children: [
      Hero(
          tag: widget.title,
          child: TextButton(
              onHover: (isHover) {
                setState(() {
                  overlayColor = isHover
                      ? Colors.black.withOpacity(0.1)
                      : Colors.transparent;
                });
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(widget.backgroundColor),
                fixedSize: MaterialStateProperty.all(Size(size, size)),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                minimumSize: MaterialStateProperty.all(Size.zero),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(size * 0.2),
                  ),
                ),
              ),
              onPressed: () async {
                if (widget.func != null) {
                  widget.func!();
                } else if (widget.url != null) {
                  await urlLauncher.loadLibrary();
                  final Uri url = Uri.parse(widget.url!);
                  if (await urlLauncher.canLaunchUrl(url)) {
                    await urlLauncher.launchUrl(url);
                  }
                } else {
                  Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      barrierDismissible: false,
                      pageBuilder: (BuildContext context, _, __) {
                        return widget.app!;
                        //LocationApp( height:height*0.9*10.42/13.84, title: title,);
                      }));
                }
              },
              child: Stack(
                children: [
                  Container(
                      padding:
                          EdgeInsets.all(widget.isPadding ? size * 0.15 : 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(size * 0.2),
                        child: widget.icon,
                      )),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size * 0.2),
                      color: overlayColor,
                    ),
                    height: size,
                    width: size,
                  )
                ],
              ))),
      Padding(
          padding: EdgeInsets.only(top: size * 0.1),
          child: Text(
            widget.title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: size * 0.2,
                decoration: TextDecoration.none),
          ))
    ]);
  }
}
