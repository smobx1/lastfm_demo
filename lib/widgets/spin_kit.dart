import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lastfmdemo/config/constants.dart' as Constants;

class SpinLoader extends StatefulWidget {
  SpinLoader({Key key}) : super(key: key);

  final spinkit = SpinKitWave(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Constants.mainColor : Constants.secondaryColor,
        ),
      );
    },
    size: 60,
  );

  @override
  _SpinLoaderState createState() => _SpinLoaderState();
}

class _SpinLoaderState extends State<SpinLoader> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}
