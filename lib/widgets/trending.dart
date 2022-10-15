import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_database/description.dart';
import 'package:movie_database/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: 'Trending Movies',
            size: 26.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
              height: 300.0,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: trending[index]['title'],
                                  bannerurl: 'https://tmdb.org/t/p/original' +
                                      trending[index]['backdrop_path'],
                                  posterurl: 'https://tmdb.org/t/p/w500' +
                                      trending[index]['poster_path'],
                                  description: trending[index]['overview'],
                                  vote: trending[index]['vote_average']
                                      .toString(),
                                  launch: trending[index]['release_date'])));
                    },
                    child: trending[index]['title'] != null
                        ? Container(
                            padding: EdgeInsets.all(5.0),
                            width: 300.0,
                            child: Column(
                              children: [
                                Container(
                                  height: 220.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://tmdb.org/t/p/original' +
                                                  trending[index]
                                                      ['backdrop_path']),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  child: ModifiedText(
                                    text: trending[index]['title'] != null
                                        ? trending[index]['title']
                                        : 'Loading',
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(),
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
              ))
        ],
      ),
    );
  }
}
