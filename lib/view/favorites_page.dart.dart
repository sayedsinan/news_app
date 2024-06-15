import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/view/detailed_page.dart';
import 'package:news_app/view/widgets/news_box.dart';

class FavoritesPage extends StatelessWidget {
  final NewsService newsService = Get.find<NewsService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Articles'),
      ),
      body: Obx(
        () {
          if (newsService.favorites.isEmpty) {
            return Center(child: Text('No favorite articles yet'));
          } else {
            return ListView.builder(
              itemCount: newsService.favorites.length,
              itemBuilder: (context, index) {
                var article = newsService.favorites[index];
                return MyCard(
                  article: article,
                  onTap: () {
                    Get.to(() => NewsDetailPage(article: article));
                  },
                  onFavoritePressed: () {
                    // Remove from favorites when heart is pressed on FavoritesPage
                    newsService.toggleFavorite(article);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
