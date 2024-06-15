import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';

class MyfavCard extends StatelessWidget {
  final NewsArticle? article;
  final VoidCallback onTap;
  final VoidCallback? onFavoritePressed;

  const MyfavCard(
      {super.key,
      this.article,
      required this.onTap,
      this.onFavoritePressed}); // Callback for favorite button press

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(article!.title),
        subtitle: Text(article!.description),
        onTap: onTap,
        trailing: IconButton(
          icon: Icon(
            article!.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: article!.isFavorite ? Colors.red : null,
          ),
          onPressed: onFavoritePressed,
        ),
      ),
    );
  }
}
