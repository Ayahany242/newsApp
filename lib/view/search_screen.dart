// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:api/controller/news_provider.dart';
import 'package:api/view/widgets/constant_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<NewsProvider>(context);
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: searchController,
                keyboardType: TextInputType.text,
                validator: ((String? value) {
                  if (value == null) {
                    return 'search must not be empty';
                  }
                  return null;
                }),
                onChanged: (value) {
                  Provider.of<NewsProvider>(context, listen: false)
                      .getsearch(value);
                },
                autofocus: true,
                // onTap: () => provider.onTappedSearch(),
                // onEditingComplete: () => print('object'),
                // onFieldSubmitted: (value) =>
                //     Provider.of<NewsProvider>(context, listen: false)
                //         .getsearch(value),
                //onSaved: (newValue) => newValue = searchController.text,
                decoration: const InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: buildArticles(
                  Provider.of<NewsProvider>(context).search, context,
                  isSearch: true),
            )
          ],
        ));
  }
}
