import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/description.dart';

class TopRated extends StatelessWidget {
  final List toprated;
  const TopRated({required this.toprated, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: 'Top Rated Movies', size: 26),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => Description(
                              name: toprated[index]['title'],
                              bannerurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                  toprated[index]['backdrop_path'],
                              posterurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                  toprated[index]['poster_path'],
                              description: toprated[index]['overview'],
                              vote: toprated[index]['vote_average'].toString(),
                              launch_on: toprated[index]['release_date'],
                            ),
                      ),
                    );
                  },
                  child:
                      toprated[index]['title'] != null
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
                                            toprated[index]['poster_path'],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  child: ModifiedText(
                                    size: 15,
                                    text:
                                        toprated[index]['title'] != null
                                            ? toprated[index]['title']
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
