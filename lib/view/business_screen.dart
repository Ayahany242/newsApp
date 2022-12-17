import 'package:api/controller/news_provider.dart';
import 'package:api/view/widgets/constant_widget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(builder: (context, provider, child) {
      List list = provider.business;
      return buildArticles(list, context);
    });
  }
}
