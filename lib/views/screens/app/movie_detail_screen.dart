import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/app_state.dart';
import '../../../model/cast.dart';
import '../../../model/movie.dart';

import '../../../provider/provider_utils.dart';
import '../../widgets/components/movie_detail_component.dart';
import '../../widgets/movie_widgets/mixins/movie_mixin.dart';
import '../review/movie_review_screen.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key, required this.id});

  final int id;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> with MovieMixin<MovieDetailScreen>{
  bool loading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    setState(() {
      loading = true;
    });
    await getMovieForId(id: widget.id);
    await getCastForMovie(id: widget.id);
    setState(() {
      loading = false;
    });
  }

  // List casts = [
  //   'assets/molly_ringwald.png',
  //   'assets/molly_ringwald.png',
  //   'assets/molly_ringwald.png',
  //   'assets/molly_ringwald.png',
  //   'assets/molly_ringwald.png',
  //   'assets/molly_ringwald.png',
  //   'assets/molly_ringwald.png',
  //   'assets/molly_ringwald.png',
  //   'assets/molly_ringwald.png',
  //   'assets/molly_ringwald.png',
  // ];
  // List castName = [
  //   'Molly',
  //   'Molly',
  //   'Molly',
  //   'Molly',
  //   'Molly',
  //   'Molly',
  //   'Molly',
  //   'Molly',
  //   'Molly',
  //   'Molly',
  // ];

  @override
  Widget build(BuildContext context) {
    final Movie? movie = context.appState.currentPic;

    final BuiltList<Cast> castMovie =
        context.appState.castForMovie ?? BuiltList<Cast>();
    if (movie == null) {
      return Container();
    }
    //var cast = Cast();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 300,
        flexibleSpace: Image.network(
          movie.posterImage,
          //image,
          width: 80,
        ),
        title: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                if (context.watch<AppState>().currentUser != null)
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext c) =>
                                MovieReviewScreen(movieId: movie.id),
                          ),
                        );
                      },
                      child: const Text('Review'),
                    ),
                  ),
                Row(
                  children: <Widget>[
                    FilledButton(
                      onPressed: () {},
                      child: Text(movie.releaseDate),
                    ),
                    FilledButton(
                      onPressed: () {},
                      child: const Text('8.5'),
                    ),
                  ],
                ),
                Text(
                  movie.title,
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                )
                //backgroundColor: Theme.of(context).shadowColor,
              ],
            )
          ],
        ),
      ),
      body: loading
          ? const CircularProgressIndicator()
          : Column(
              children: <Widget>[
                const Text(
                  'SYNOPSIS',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Text(
                  movie.overview,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
                const Text(
                  'Cast',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: castMovie.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        final Cast p = castMovie[index];
                        // final cast = casts[index];
                        // final name = castName[index];
                        return CastComponent(
                          cast: p,
                          // castName: name,
                          // imageURL: cast,
                        );
                      }),
                ),
                const Text(
                  'ABOUT',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const Text(
                          'adult -',
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        Text(
                          movie.adult.toString(),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Text(
                          'backdrop_path -',
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Text(
                          movie.backdropPath,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Text(
                          'genre_ids -',
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        Text(
                          movie.genreIds.toString(),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Text(
                          'id -',
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        Text(
                          movie.id.toString(),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Text(
                          'original_language -',
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          movie.originalLanguage,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Text(
                          'original_title -',
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Text(
                          movie.originalTitle,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Text(
                          'overview -',
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        Text(
                          movie.overview,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Text(
                          'popularity -',
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        Text(
                          movie.popularity.toString(),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Text(
                          'poster_path -',
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Text(
                          movie.posterPath,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Text(
                          'release_date -',
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Text(
                          movie.releaseDate,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Text(
                          'title -',
                        ),
                        const SizedBox(
                          width: 110,
                        ),
                        Text(movie.title),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Text(
                          'video -',
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        Text(
                          movie.video.toString(),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Text(
                          'vote_average -',
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Text(
                          movie.voteAverage.toString(),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Text(
                          'vote_count -',
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        Text(
                          movie.voteCount.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
//casttile component

/*class CastTile extends StatelessWidget {
  const CastTile({
    super.key,
    required this.name,
    required this.cast,
  });

  final String name;
  final String cast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          cast,
          width: 100,
          height: 100,
        ),
        Text(name),
      ],
    );
  }
}
*/
