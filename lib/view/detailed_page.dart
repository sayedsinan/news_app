import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';

class NewsDetailPage extends StatelessWidget {
  final NewsArticle article;

  const NewsDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            article.imageUrl.isNotEmpty
                ? Image.network(
                    article.imageUrl,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/nothing.jpg',
                    fit: BoxFit.cover,
                  ),

            const SizedBox(height: 8.0),
            Row(
              children: [
                Text('Publihed by '),
                Text(
                  article.sourceName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.0),
            Text(
              article.description,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 8.0),
            // Add more details or widgets as needed
          ],
        ),
      ),
    );
  }
}
