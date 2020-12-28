part of 'pages.dart';

class ArticleListPage extends StatefulWidget {
  static const routeName = '/article_list';

  @override
  _ArticleListPageState createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  int bottomNavIndex = 0;
  Future<ArticlesResult> _article;

  @override
  void initState() {
    _article = ApiService().topHeadlines();
    super.initState();
  }

  Widget _buildList(BuildContext context) {
    return FutureBuilder(
      future: _article,
      builder: (context, AsyncSnapshot<ArticlesResult> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.articles.length,
              itemBuilder: (context, index) {
                var article = snapshot.data.articles[index];
                return CardArticle(
                  article: article,
                  onPressed: () => Navigator.pushNamed(
                    context,
                    ArticleDetailPage.routeName,
                    arguments: article,
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          } else {
            return Text('');
          }
        }
      },
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('News App'),
        transitionBetweenRoutes: false,
      ),
      child: _buildList(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
