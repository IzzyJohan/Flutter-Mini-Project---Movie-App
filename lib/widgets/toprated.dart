import 'package:flutter/material.dart';
import 'package:movie_database/description.dart';
import 'package:movie_database/utils/text.dart';

class TopRated extends StatelessWidget {
  final List toprated;

  const TopRated({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: 'Top Rated Movies',
            size: 26.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
              height: 270.0,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: toprated[index]['title'],
                                  bannerurl: 'https://tmdb.org/t/p/original' +
                                      toprated[index]['backdrop_path'],
                                  posterurl: 'https://tmdb.org/t/p/w500' +
                                      toprated[index]['poster_path'],
                                  description: toprated[index]['overview'],
                                  vote: toprated[index]['vote_average']
                                      .toString(),
                                  launch: toprated[index]['release_date'])));
                    },
                    child: toprated[index]['title'] != null
                        ? Container(
                            width: 140.0,
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://tmdb.org/t/p/w500' +
                                                  toprated[index]
                                                      ['poster_path']))),
                                ),
                                Container(
                                  child: ModifiedText(
                                    text: toprated[index]['title'] != null
                                        ? toprated[index]['title']
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
                itemCount: toprated.length,
              ))
        ],
      ),
    );
  }
}
