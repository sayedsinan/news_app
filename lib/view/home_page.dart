import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/view/detailed_page.dart';
import 'package:news_app/view/favorites_page.dart.dart';
import 'package:news_app/view/widgets/news_box.dart';
import 'package:news_app/view/widgets/searrching_bar.dart';

class HomePage extends StatelessWidget {
  final NewsService newsService = Get.find<NewsService>();

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('News App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ArticleSearchDelegate(newsService.articles),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Get.to(() => FavoritesPage()); // Navigate to FavoritesPage
            },
          ),
        ],
      ),
      body: Obx(
        () {
          if (newsService.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (newsService.articles.isEmpty) {
            return const Center(child: Text('No articles available'));
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: newsService.articles.length,
                    itemBuilder: (context, index) {
                      var article = newsService.articles[index];
                      return MyCard(
                        article: article,
                        onTap: () {
                          Get.to(() => NewsDetailPage(article: article));
                        },
                        onFavoritePressed: () {
                          // Toggle favorite status and update favorites list
                          newsService.toggleFavorite(article);
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
