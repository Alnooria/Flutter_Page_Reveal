import 'package:flutter/material.dart';
import 'pages.dart';
import 'page_reveal.dart';
import 'pager_indicator.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   int activeIndex = 0;
  int nextPageIndex = 1;
  SlideDirection slideDirection = SlideDirection.none;
  double slidePercent = 0.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: [
          Page(
            viewModel: pages[0],
            percentVisible: 0.7
          ),
        PageReveal(
          revealPercent: 1.0,
          child: Page(
            viewModel: pages[1],
            percentVisible: 0.7
          )
        ),
       PagerIndicator(
            viewModel: PagerIndicatorViewModel(
              pages,
              1,
              SlideDirection.rightToLeft,
              1.0,
            ),
          ),
        ],
      ),
    );
  }
}
