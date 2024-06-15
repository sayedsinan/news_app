import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/model/article.dart';

class ArticleSearchDelegate extends SearchDelegate<NewsArticle> {
  final List<NewsArticle> articles;

  ArticleSearchDelegate(this.articles);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Get.back();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredArticles = articles
        .where((article) =>
            article.title.toLowerCase().contains(query.toLowerCase()) ||
            article.description.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredArticles.length,
      itemBuilder: (context, index) {
        var article = filteredArticles[index];
        return ListTile(
          title: Text(article.title),
          subtitle: Text(article.description),
          onTap: () {
            close(context, article);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? articles
        : articles
            .where((article) =>
                article.title.toLowerCase().contains(query.toLowerCase()) ||
                article.description.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        var article = suggestionList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.black),
            ),
            title: Text(article.title),
            onTap: () {
              query = article.title;
              close(context, article);
            },
          ),
        );
      },
    );
  }
}
