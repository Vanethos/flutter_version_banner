# Version Banner

An app Banner Widget that shows the current app version. Can be used with [App Flavors](https://flutter.dev/docs/deployment/flavors) to show what flavor of the app is currently being used.


## Getting Started


This widget should wrap `MaterialApp` or `CupertinoApp`. 

![Example](https://user-images.githubusercontent.com/10728633/59044609-5aa82c00-8876-11e9-99d2-da84a81af2e6.png)

```dart
VersionBanner(
          text: "Yay!",
          packageExtensions: [".dev"],
          child: MaterialApp(
                       debugShowCheckedModeBanner: false,
                       title: 'Flutter Demo',
                       theme: ThemeData(
                         primarySwatch: Colors.blue,
                       ),
                       home: MyHomePage(title: 'Flutter Demo Home Page'),
                     )
      );
```

`packageExtensions` will check the app's package name with the given array. If the package name contains part of the String in the array, then the banner is visible.

The following properties can be changed:

* `color` - Banner's color
* `textStyle` -  Banner's text style
* `text` - The text to appear. If set to null will show the `pubspec` version
* `location` - the banner's location on the screen, based on the class [BannerLocation](https://api.flutter.dev/flutter/widgets/BannerLocation-class.html)
* `packageExtensions` - will check the app's package name with the given array. If the package name contains part of the String in the array, then the banner is visible.
* `visible` - decides if the banner is visible or not. If set to `false`, it overrides the `packageExtensions` attribute
