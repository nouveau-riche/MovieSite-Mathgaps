import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constant.dart';
import '../core/vx_store.dart';
import '../widgets/movie_item.dart';

class MoviesListScreen extends StatelessWidget {
  final MyStore store = VxState.store;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    FetchMovie().perform(); // fetching all movies from store
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Hello Nikunj!\nWelcome to Movie Site',
          style: TextStyle(
              color: kTextColor, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        backgroundColor: kBackgroundColor,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right :mq.width*0.02),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: kTextColor,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://images-na.ssl-images-amazon.com/images/I/41r0oAaPp0L._AC_.jpg'),
              ),
            ),
          ),
        ],
      ),
      body: VxBuilder(
        mutations: {FetchMovie},
        builder: (ctx, _, status) {
          return Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(mq.width * 0.04),
                    child: const Text(
                      'Trending',
                      style: TextStyle(
                          color: kTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: store.movies.length,
                  itemBuilder: (context, index) {
                    return MovieItem(movie: store.movies[index]);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
