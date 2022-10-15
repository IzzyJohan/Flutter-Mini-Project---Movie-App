import 'package:flutter/material.dart';
import 'package:movie_database/utils/text.dart';

class Description extends StatelessWidget {
  final String? name, description, bannerurl, posterurl, vote, launch;

  const Description(
      {super.key,
      this.name,
      this.description,
      this.bannerurl,
      this.posterurl,
      this.vote,
      this.launch});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Container(
                height: 250.0,
                child: Stack(
                  children: [
                    Positioned(
                        child: Container(
                      height: 250.0,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerurl!,
                        fit: BoxFit.cover,
                      ),
                    )),
                    Positioned(
                      child: ModifiedText(
                        text: 'Average Rating - ' + vote!,
                        size: 18.0,
                      ),
                      bottom: 10,
                    )
                  ],
                )),
            SizedBox(height: 5.0),
            Container(
              padding: EdgeInsets.all(10.0),
              child: ModifiedText(
                text: name != null ? name : 'Not Loaded',
                size: 24.0,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              child: ModifiedText(
                text: 'Releasing on - ' + launch!,
                size: 14,
              ),
            ),
            SizedBox(height: 12.0),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl!),
                  margin: EdgeInsets.all(10.0),
                ),
                Flexible(
                  child: Container(
                    child: ModifiedText(
                      text: description,
                      size: 18.0,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
