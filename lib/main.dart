import 'package:flutter/material.dart';
import 'package:news_app/shared/shared.dart';
import 'package:news_app/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: secondaryColor,
        textTheme: myTextTheme,
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          textTheme: myTextTheme.apply(bodyColor: Colors.black),
          elevation: 0,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: secondaryColor,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0),
            ),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: secondaryColor,
          unselectedItemColor: Colors.grey,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        ArticleDetailPage.routeName: (context) => ArticleDetailPage(
              article: ModalRoute.of(context).settings.arguments,
            ),
        ArticleWebView.routeName: (context) =>
            ArticleWebView(url: ModalRoute.of(context).settings.arguments),
      },
    );
  }
}
