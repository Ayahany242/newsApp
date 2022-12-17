import 'package:api/controller/news_provider.dart';
import 'package:api/view/web_view_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildArticleItem(article, context) => InkWell(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => WebViewScreen(
                      url: article['url'],
                    )))
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  //mainAxisSize: MainAxisSize.min,

                  crossAxisAlignment: CrossAxisAlignment.start,

                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Provider.of<NewsProvider>(context, listen: false)
                            .textStyle,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget myDivider() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Divider(
      height: 12.0,
      thickness: 2.0,
    ),
  );
}

Widget buildArticles(List list, BuildContext context, {bool isSearch = false}) {
  return ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (context) => ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) =>
          buildArticleItem(list[index], context),
      separatorBuilder: (BuildContext context, int index) => myDivider(),
      itemCount: list.length,
    ),
    fallback: ((context) => isSearch
        ? Container()
        : const Center(
            child: CircularProgressIndicator(),
          )),
  );
}
