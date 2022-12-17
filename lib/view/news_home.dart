import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:api/controller/news_provider.dart';
import 'package:api/view/search_screen.dart';

class NewsHome extends StatelessWidget {
  const NewsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          title: const Text('News App'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SearchScreen()),
                );
              },
              icon: const Icon(Icons.search),
            ),
            IconButton(
              icon: const Icon(Icons.brightness_4_outlined),
              onPressed: (() => provider.changeAppMode()),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: provider.bottomItems,
          currentIndex: provider.currentIndex,
          onTap: (index) {
            provider.changeNavBarIndex(index);
          },
        ),
        body: provider.screens[provider.currentIndex],
      ),
    );
  }
}
