import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/news_provider.dart';
import 'widgets/constant_widget.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(builder: (context, provider, child) {
      List list = provider.sport;
      return buildArticles(list, context);
    });
  }
}
