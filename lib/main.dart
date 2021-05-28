import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import './core/vx_store.dart';
import './screens/movies_list_screen.dart';

void main() {
  runApp(VxState(
    child: MyApp(),
    store: MyStore(),
  ));
}

// starting point of application

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Movies App",
      debugShowCheckedModeBanner: false,
      home: MoviesListScreen(),
    );
  }
}
