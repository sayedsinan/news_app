import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:news_app/model/article.dart';

class NewsService extends GetxController {
  RxList<NewsArticle> articles = <NewsArticle>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  Future<void> fetchArticles() async {
    isLoading(true);
    final String apiUrl =
        'https://newsapi.org/v2/everything?q=apple&from=2024-06-13&to=2024-06-13&sortBy=popularity&apiKey=f0d3d4fc2b0140509461ef9e808c8841';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(response.body);
        print(response.body);
        List<dynamic> articlesJson = jsonData['articles'];

        List<NewsArticle> fetchedArticles = articlesJson
            .map((json) => NewsArticle.fromJson(json))
            .where((article) =>
                article.title.isNotEmpty &&
                article.imageUrl.isNotEmpty &&
                article.sourceName.isNotEmpty &&
                article.description.isNotEmpty)
            .toList();

        if (fetchedArticles.isNotEmpty) {
          articles.assignAll(fetchedArticles);
        } else {
          throw Exception('No articles available');
        }
      } else {
        throw Exception(
            'Failed to load articles. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      // Handle error state here, e.g., show snackbar or retry button
    } finally {
      isLoading(false);
    }
  }
}
