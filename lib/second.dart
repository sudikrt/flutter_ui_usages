import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final ThemeData IOSTHEME = new ThemeData(
  primarySwatch: Colors.red[400],
  primaryColor: Colors.grey,
  primaryColorBrightness: Brightness.light
);

final ThemeData DefaultTheme = new ThemeData(
  primarySwatch: Colors.lightBlue,
  accentColor: Colors.orangeAccent[400]
);

class SecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Design App",
      theme:  defaultTargetPlatform == TargetPlatform.iOS
          ? IOSTHEME
          : DefaultTheme,
      home: new GeekApp (),
    );
  }
}
class GeekApp extends StatefulWidget {

  @override
  State createState() {
    return new GeekAppState();
  }
}
class GeekAppState extends State<GeekApp> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          color: Colors.white,
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.canPop(context)
        ),
        title: new Text('Some Text'),
        actions: <Widget> [
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: null)
        ],
      ),
    );
  }
}