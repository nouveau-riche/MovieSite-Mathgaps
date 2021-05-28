import 'package:flutter/material.dart';

import '../constant.dart';

class MovieDetailScreen extends StatelessWidget {
  final String image;
  final String year;
  final String title;

  MovieDetailScreen({this.title, this.image, this.year});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Container(
            width: mq.width,
            height: mq.height * 0.6,
            child: new ClipPath(
              child: Image.network(
                image,
                fit: BoxFit.fill,
              ),
              clipper: ImagePath(),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 20, color: kTextColor, fontWeight: FontWeight.bold),
          ),
          Text(
            year,
            style: const TextStyle(
                fontSize: 18, color: kTextColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class ImagePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height / 1.5);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
