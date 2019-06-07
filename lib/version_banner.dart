library version_banner;

import 'package:flutter/widgets.dart';
import 'package:package_info/package_info.dart';

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

  /// Visibility of the banner
  bool visible;

  /// List of package extensions to hide or show
  ///
  /// Checks if the package name has a string in the array, eg.:
  ///   `com.vanethos.example.dev` with array `["dev"]`
  ///
  /// This property is overriden by [visible]. If [visible] is false,
  /// the banner will not be shown.
  List<String> packageExtensions;

  VersionBanner(
      {@required this.child,
      this.text,
      this.location = BannerLocation.topEnd,
      this.textStyle = const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.bold),
      this.color = const Color.fromARGB(255, 255, 0, 0),
      this.visible = true, this.packageExtensions});

  @override
  Widget build(BuildContext context) {
    if (visible) {
      /// If the banner is visible, we need to check if we are going to present
      /// the default text OR if we are going to check the visibility of the
      /// banner via the package extensions.
      /// If this is the case, we will need to access the package_info plugin
      if (text == null || packageExtensions!= null) {
        return FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var isDev = false;
                if (packageExtensions != null) {
                  for (var package in packageExtensions) {
                    if (snapshot.data.packageName.contains(package)) {
                      isDev = true;
                      break;
                    }
                  }
                } else {
                  isDev = true;
                }

                if (isDev) {
                  return Directionality(
                    textDirection: TextDirection.ltr,
                    child: Banner(
                      color: color,
                      message: text ?? snapshot.data.version,
                      location: location,
                      textStyle: textStyle,
                      child: child,
                    ),
                  );
                }
              }

              /// If we are not in a development package, return the original child
              return child;
            }
        );
      }

      /// If we don't use the default text or search the package names, then
      /// we return the banner with the user's input
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

    /// The banner is not visible, return the child instead
    return child;
  }
}
