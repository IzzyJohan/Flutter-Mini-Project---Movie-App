import 'package:flutter/material.dart';
import 'package:movie_database/description.dart';
import 'package:movie_database/utils/text.dart';

class Series extends StatelessWidget {
  final List series;

  const Series({super.key, required this.series});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: 'TV Series',
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
                                  name: series[index]['original_name'],
                                  bannerurl: 'https://tmdb.org/t/p/original' +
                                      series[index]['backdrop_path'],
                                  posterurl: 'https://tmdb.org/t/p/w500' +
                                      series[index]['poster_path'],
                                  description: series[index]['overview'],
                                  vote:
                                      series[index]['vote_average'].toString(),
                                  launch: series[index]['first_air_date'])));
                    },
                    child: series[index]['original_name'] != null
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
                                                  series[index]
                                                      ['poster_path']))),
                                ),
                                Container(
                                  child: ModifiedText(
                                    text: series[index]['original_name'] != null
                                        ? series[index]['original_name']
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
                itemCount: series.length,
              ))
        ],
      ),
    );
  }
}
