import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../models/movie.dart';
import '../screens/movie_detail_screen.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({this.movie});

  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (ctx) => MovieDetailScreen(
              title: movie.title,
              image: movie.poster,
              year: movie.year,
            ),
          ),
        );
      },
      child: Container(
        height: mq.height * 0.2,
        width: mq.width,
        margin: EdgeInsets.all(mq.width*0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: mq.height * 0.04,
                width: mq.width,
                color: kBackgroundColor,

              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: mq.height * 0.16,
                width: mq.width,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: mq.width * 0.4,
                          child: Text(
                            movie.title,
                            style: const TextStyle(
                                color: kTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: mq.width * 0.4,
                          child: Text(
                            movie.year,
                            style: const TextStyle(
                                color: kTextColor,
                                fontSize: 12.5,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: mq.height * 0.16,
                  width: mq.width * 0.28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    movie.poster,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
