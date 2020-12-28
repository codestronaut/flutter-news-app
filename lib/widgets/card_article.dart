part of 'widgets.dart';

class CardArticle extends StatelessWidget {
  final Article article;
  final Function onPressed;
  const CardArticle({@required this.article, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        leading: article.urlToImage == null
            ? Container(
                width: 100,
                child: Icon(Icons.error),
              )
            : Hero(
                tag: article.urlToImage,
                child: Image.network(
                  article.urlToImage,
                  width: 100,
                ),
              ),
        title: Text(
          article.title ?? "",
        ),
        subtitle: Text(
          article.author ?? "",
        ),
        onTap: onPressed,
      ),
    );
  }
}
