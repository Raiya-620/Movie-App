import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({required this.trending, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: 'Trending Movies', size: 26),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => Description(
                              name: trending[index]['title'],
                              bannerurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                  trending[index]['backdrop_path'],
                              posterurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                  trending[index]['poster_path'],
                              description: trending[index]['overview'],
                              vote: trending[index]['vote_average'].toString(),
                              launch_on: trending[index]['release_date'],
                            ),
                      ),
                    );
                  },
                  child:
                      trending[index]['title'] != null
                          ? Container(
                            width: 140,
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://tmdb.org/t/p/w500' +
                                            trending[index]['poster_path'],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  child: ModifiedText(
                                    size: 15,
                                    text:
                                        trending[index]['title'] != null
                                            ? trending[index]['title']
                                            : 'Loading',
                                  ),
                                ),
                              ],
                            ),
                          )
                          : Container(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
