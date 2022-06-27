import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/toprated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  final String apikey = '5c19a047794d22d634396e0ab4282b39';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1YzE5YTA0Nzc5NGQyMmQ2MzQzOTZlMGFiNDI4MmIzOSIsInN1YiI6IjYyYjgxZDMxMjI5YWUyMGI1YzdlZGI0NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.hbcFy1bOj4YHIyYFI-IPwNBzJRTg_PGl5Xg9vfwhyrg';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithcustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingresults = await tmdbWithcustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithcustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithcustomLogs.v3.tv.getPopular();
    // ignore: avoid_print

    setState(() {
      trendingmovies = trendingresults['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });

    //print(trendingresults['results']);

    //print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Modifiedtext(
            text: 'Movie App',
            color: Colors.white,
            size: 20.0,
          ),
        ),
        body: ListView(
          children: [
            TrendingMovies(trending: trendingmovies),
            Toprated(toprated: topratedmovies),
            TV(tv: tv),
          ],
        ));
  }
}
