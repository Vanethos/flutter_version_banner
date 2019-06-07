library version_banner;

import 'package:flutter/widgets.dart';

/// Version Banner Widget
///
/// An app Banner Widget that shows the current app version. Can be used with
/// App Flavors (https://flutter.dev/docs/deployment/flavors) to show what flavor
/// of the app is currently being used.
///
/// Usage:
///
/// ```
/// VersionBanner(
///           text: "Yay!",
///           child: MaterialApp(
///                        debugShowCheckedModeBanner: false,
///                        title: 'Flutter Demo',
///                        theme: ThemeData(
///                          primarySwatch: Colors.blue,
///                        ),
///                        home: MyHomePage(title: 'Flutter Demo Home Page'),
///                      )
///       );
/// ```
class VersionBanner extends StatelessWidget {
  /// Material or Cupertino App Widget
  ///
  /// The VersionBanner Widget should wrap the Material or Cupertino App Widgets
  ///
  /// ```
  /// class MyApp extends StatelessWidget {
  ///   MyApp();
  ///
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     return VersionBanner(
  ///         text: "Yay!",
  ///         child: var materialApp = MaterialApp(
  ///           debugShowCheckedModeBanner: false,
  ///           title: 'Flutter Demo',
  ///           theme: ThemeData(
  ///             primarySwatch: Colors.blue,
  ///           ),
  ///           home: MyHomePage(title: 'Flutter Demo Home Page'),
  ///         );
  ///     );
  ///   }
  /// }
  /// ```
  Widget child;

  /// Banner Location on the app, see [BannerLocation] for possible values.
  ///
  /// Has a default value of BannerLocation.topEnd
  BannerLocation location;

  /// Text Style to be applied in the Banner
  ///
  /// Has a default value of a white bold text
  TextStyle textStyle;

  /// Banner message
  String text;

  /// Banner color
  ///
  /// Has a default value of Red
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
