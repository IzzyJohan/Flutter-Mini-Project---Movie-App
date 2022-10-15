import 'package:flutter/material.dart';
import 'package:movie_database/login.dart';
import 'package:movie_database/profile.dart';
import 'package:movie_database/sign_up.dart';
import 'package:movie_database/utils/text.dart';
import 'package:movie_database/widgets/navbar.dart';
import 'package:movie_database/widgets/series.dart';
import 'package:movie_database/widgets/toprated.dart';
import 'package:movie_database/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/login': (context) => Login(),
        '/sign_up': (context) => SignUp(),
        '/profile': (context) => Profile()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List series = [];
  int selectedIndex = 0;

  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final String apiKey = 'cdf47de994b7f5cb0ac21ca1154154f9';
  final String apiReadAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZGY0N2RlOTk0YjdmNWNiMGFjMjFjYTExNTQxNTRmOSIsInN1YiI6IjYyOThhYzEzYTQ0ZDA5NTI3NmUzZWVhMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VE-stP6ef40qflG8FrO84JkZzZP_rD-TWVTJhGhHqSE';

  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, apiReadAccessToken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map trendingResults = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResutls = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map seriesResults = await tmdbWithCustomLogs.v3.tv.getPopular();
    setState(() {
      trendingMovies = trendingResults['results'];
      topRatedMovies = topRatedResutls['results'];
      series = seriesResults['results'];
    });
    print(series);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ModifiedText(text: 'Movie App'),
      ),
      body: ListView(
        children: [
          TrendingMovies(trending: trendingMovies),
          TopRated(toprated: topRatedMovies),
          Series(series: series)
        ],
      ),
      bottomNavigationBar: Navbar(
        selectedIndex: selectedIndex,
        onClicked: onClicked,
      ),
    );
  }
}
