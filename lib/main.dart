import 'package:flutter/material.dart';
import 'package:lastfmdemo/providers/data_provider.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      // Provider<DataProvider>(create: (_) => DataProvider()),
      ChangeNotifierProvider<DataProvider>.value(
        value: DataProvider(),
      ),
    ],
    child: MyApp(),
  ));
}
