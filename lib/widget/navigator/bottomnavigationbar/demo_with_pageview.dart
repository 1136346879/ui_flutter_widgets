import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _index = 0;
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _index = index;
          });
        },
        children: [
          Center(
            child: Column(
              children: [
                Text('页面一'),
                Text('左右滑动切换页面哦~~~'),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('页面二'),
                Text('左右滑动切换页面哦~~~'),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('页面三'),
                Text('左右滑动切换页面哦~~~'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          setState(() {
            _index = index;
          });
          _pageController.jumpToPage(index);
        },
        fixedColor: Colors.red,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
            title: Text(
              '导航一',
              style: TextStyle(color: Colors.red),
            ),
            icon: Icon(
              Icons.navigate_before,
              color: Colors.redAccent,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              '导航二',
              style: TextStyle(color: Colors.red),
            ),
            icon: Icon(
              Icons.notifications_active,
              color: Colors.redAccent,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              '导航三',
              style: TextStyle(color: Colors.red),
            ),
            icon: Icon(
              Icons.navigate_next,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
