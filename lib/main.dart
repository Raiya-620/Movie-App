import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/top_rated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apikey = '5b6312a9e1a3825529d9704c5521c685';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1YjYzMTJhOWUxYTM4MjU1MjlkOTcwNGM1NTIxYzY4NSIsIm5iZiI6MTc0NzQzMjY2MS4zMTksInN1YiI6IjY4MjdiNGQ1M2E0MjJiN2UzMzViNGQ5ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TpiXjkDPZ_9RJjqZlCx72WY7d7HR5ctzAITjKEITxqc';
  List trendingmovies = [];
  List tv = [];
  List toprated = [];

  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    );

    Map trendingresults = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresults = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingmovies = trendingresults['results'];
      toprated = topratedresults['results'];
      tv = tvresults['results'];
    });
    print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: ModifiedText(text: 'Flutter Movie App ❤️')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TV(tv: tv),
            TopRated(toprated: toprated),
            TrendingMovies(trending: trendingmovies),
          ],
        ),
      ),
    );
  }
}
