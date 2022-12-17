import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/news_provider.dart';
import 'widgets/constant_widget.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(builder: (context, provider, child) {
      List list = provider.science;
      return buildArticles(list, context);
    });
  }
}
