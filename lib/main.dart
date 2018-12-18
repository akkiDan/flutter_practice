import 'package:flutter/material.dart';
import 'package:flutter_demo/app/constants.dart';
import 'package:flutter_demo/app/form_demo.dart';
import 'package:flutter_demo/pages/demo_list_page.dart';
import 'package:flutter_demo/pages/home_page.dart';
import 'package:flutter_demo/pages/movie_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final route = <String,WidgetBuilder>{
      Constants.HOMEPAGE.toString() : (context) => MyHomePage(),
      Constants.FORMDEMO.toString() : (context) => FormDemo(),
      Constants.DEMOLIST.toString() : (context) => DemoList(),
      Constants.MOVIEDETAILS.toString() : (context) => MovieDetails(),
    };
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        accentColor: Colors.grey
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: route,
    );
  }
}


