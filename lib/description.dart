import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class Description extends StatelessWidget {
  final String name;
  final String description;
  final String bannerurl, posterurl, vote, launch_on;
  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: ListView(
            children: [
              Container(
                height: 250,
                child: Stack(
                  children: [
                    Positioned(
                      child: bannerurl != 'Not found'
                          ? Container(
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                              child: Image.network(
                                bannerurl,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(),
                    ),
                    Positioned(
                        bottom: 10,
                        child: Modifiedtext(
                            text: '⭐ Average rating:  ' + vote, size: 18.0))
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Modifiedtext(
                    text: name != null ? name : 'Not Loaded', size: 24),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Modifiedtext(
                    text: 'Releasing On: ' + launch_on, size: 14.0),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5.0),
                    height: 200,
                    width: 100,
                    child: Image.network(posterurl),
                  ),
                  Flexible(
                    child: Container(
                      child: Modifiedtext(text: description, size: 18.0),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
