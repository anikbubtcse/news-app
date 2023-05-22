import 'package:flutter/material.dart';
import 'package:news_app/screen/all_news_screen.dart';
import 'breaking_news_screen.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('News.org'),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(
                Icons.all_inbox,
                color: Colors.amber,
              ),
              text: 'All News',
            ),
            Tab(
              icon: Icon(
                Icons.all_inbox_outlined,
                color: Colors.amber,
              ),
              text: 'Breaking News',
            ),
          ]),
        ),
        body: TabBarView(
          children: [AllNews(), BreakingNews()],
        ),
      ),
    );
  }
}
