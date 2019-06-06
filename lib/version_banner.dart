library version_banner;

import 'package:flutter/widgets.dart';

class VersionBanner extends StatelessWidget {
  Widget child;
  BannerLocation location;
  TextStyle textStyle;
  String text;
  Color color;

  VersionBanner(
      {@required this.child,
      @required this.text,
      this.location = BannerLocation.topEnd,
      this.textStyle = const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.bold),
      this.color = const Color.fromARGB(255, 255, 0, 0)});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Banner(
        color: color,
        message: text,
        location: location,
        textStyle: textStyle,
        child: child,
      ),
    );
  }
}
