import 'package:flutter/material.dart';
import 'package:efox_flutter/components/widgetComp.dart' as WidgetComp;
import 'demo.dart' as Demo;
import 'demo_with_pageview.dart' as DemoWithPageView;

class Index extends StatefulWidget {
  static String title = 'BottomNavigationBar';
  static String mdUrl = 'docs/widget/navigator/bottomnavigationbar/index.md';
  static String originCodeUrl = 'https://docs.flutter.io/flutter/material/BottomNavigationBar-class.html';

  @override
  _IndexState createState() => new _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return WidgetComp.Index(
      title: Index.title,
      originCodeUrl: Index.originCodeUrl,
      mdUrl: Index.mdUrl,
      demoChild: [
        Demo.Index(),
        DemoWithPageView.Index(),
      ],
    );
  }
}
