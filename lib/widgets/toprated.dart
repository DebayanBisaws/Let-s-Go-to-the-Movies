// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../description.dart';
import '../utils/text.dart';

class Toprated extends StatelessWidget {
  final List toprated;
  const Toprated({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Modifiedtext(
              text: 'Toprated Movies',
              size: 26.0,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 270,
                child: ListView.builder(
                  itemCount: toprated.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: toprated[index]['title'],
                                  description: toprated[index]['overview'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      toprated[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      toprated[index]['poster_path'],
                                  vote: toprated[index]['vote_average']
                                      .toString(),
                                  launch_on: toprated[index]['release_date'])),
                        );
                      },
                      child: toprated[index]['title'] != null
                          ? Container(
                              width: 140,
                              child: Column(
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://image.tmdb.org/t/p/w500' +
                                                    toprated[index]
                                                        ['poster_path']))),
                                  ),
                                  Container(
                                    child: Modifiedtext(
                                      text: toprated[index]['title'] != null
                                          ? toprated[index]['title']
                                          : 'Loading',
                                      size: 10.0,
                                    ),
                                  )
                                ],
                              ))
                          : Container(),
                    );
                  },
                ))
          ],
        ));
  }
}
