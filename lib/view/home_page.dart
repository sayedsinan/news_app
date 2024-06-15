import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/view/detailed_page.dart';
import 'package:news_app/view/widgets/news_box.dart';
// Replace with your news detail page file

class HomePage extends StatelessWidget {
  final NewsService newsService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Obx(
        () {
          if (newsService.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (newsService.articles.isEmpty) {
            return Center(child: Text('No articles available'));
          } else {
            return ListView.builder(
              itemCount: newsService.articles.length,
              itemBuilder: (context, index) {
                var article = newsService.articles[index];
                return MyCard(
                  article: article,
                  onTap: () {
                    Get.to(() => NewsDetailPage(article: article));
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
