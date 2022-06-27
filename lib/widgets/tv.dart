// ignore_for_file: prefer_const_constructors

// ignore_for_file: prefer_const_constructors
//NetworkImage(tv[index]
// ['backdrop_path'] !=
//  null
// ? 'https://image.tmdb.org/t/p/w500' +
//   tv[index]['backdrop_path']
// : 'https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg')

import 'package:flutter/material.dart';

import '../description.dart';
import '../utils/text.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Modifiedtext(
              text: 'Popular Tv shows and Movies',
              size: 26.0,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 200,
                child: ListView.builder(
                  itemCount: tv.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: (tv[index]['overview'] != null &&
                              tv[index]['backdrop_path'] != null)
                          ? Container(
                              padding: EdgeInsets.all(5.0),
                              width: 250,
                              child: Column(
                                children: [
                                  Container(
                                    width: 250,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: tv[index]['backdrop_path'] != null
                                          ? DecorationImage(
                                              image: NetworkImage(
                                                  'https://image.tmdb.org/t/p/w500' +
                                                      tv[index]
                                                          ['backdrop_path']),
                                              fit: BoxFit.cover,
                                            )
                                          : DecorationImage(
                                              image: AssetImage(
                                                  'assets/poster.png'),
                                            ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Modifiedtext(
                                      text: tv[index]['original_name'] != null
                                          ? tv[index]['original_name']
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
