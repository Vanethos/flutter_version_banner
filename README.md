# Version Banner

An app Banner Widget that shows the current app version. Can be used with [App Flavors](https://flutter.dev/docs/deployment/flavors) to show what flavor of the app is currently being used.


## Getting Started


This widget should wrap `MaterialApp` or `CupertinoApp`. 

![Example](https://user-images.githubusercontent.com/10728633/59044609-5aa82c00-8876-11e9-99d2-da84a81af2e6.png)

```dart
VersionBanner(
          text: "Yay!",
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

The following properties can be changed:

* `color`
* `textStyle`
* `text`
* `location`

This package can also be used with [package_info](https://pub.dev/packages/package_info) to know what is the current flavour of the app and show/hide the banner accordingly

```dart
void main() async {
  var packageInfo = await PackageInfo.fromPlatform();
  var packageName = packageInfo.packageName;
  runApp(MyApp(packageName));
}

class MyApp extends StatelessWidget {
  String packageName;
  
  MyApp(this.packageName);

  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );

    if (packageName.contains("dev") || packageName.contains("alpha")) {
      return VersionBanner(
          text: "Yay!",
          child: materialApp
      );
    }

    return materialApp;
  }
}
```
