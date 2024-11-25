import 'package:built_collection/built_collection.dart';

import '../../../../model/app_state.dart';
import '../../../../model/cast.dart';
import '../../../../model/movie.dart';
import '../../../../ui.dart';
import '../../../mixins/movie_mixin.dart';
import '../../../navigation/app_routes.dart';
import 'movie_component/movie_detail_component.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key, required this.id});

  final int id;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen>
    with MovieMixin<MovieDetailScreen> {
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

  @override
  Widget build(BuildContext context) {
    final Movie? movie = context.appState.currentPic;

    final BuiltList<Cast> castMovie =
        context.appState.castForMovie ?? BuiltList<Cast>();
    if (movie == null) {
      return Container();
    }
    return AppScaffold(
      appBar: ApplicationAppBar(
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
                        context
                            .go(MovieReviewPageRoute(rid: movie.id).location);
                        // Navigator.of(context).push(
                        //   MaterialPageRoute<dynamic>(
                        //     builder: (BuildContext c) =>
                        //         MovieReviewScreen(movieId: movie.id),
                        //   ),
                        // );
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
                AppText(
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
          ? const AppProgressIndicator()
          : Column(
              children: <Widget>[
                const AppText(
                  'SYNOPSIS',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                AppText(
                  movie.overview,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
                const AppText(
                  'Cast',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: castMovie.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        final Cast p = castMovie[index];
                        return CastComponent(
                          cast: p,
                        );
                      }),
                ),
                const AppText(
                  'ABOUT',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const AppText(
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
                        const AppText(
                          'backdrop_path -',
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        AppText(
                          movie.backdropPath,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const AppText(
                          'genre_ids -',
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        AppText(
                          movie.genreIds.toString(),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const AppText(
                          'id -',
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        AppText(
                          movie.id.toString(),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const AppText(
                          'original_language -',
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        AppText(
                          movie.originalLanguage,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const AppText(
                          'original_title -',
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        AppText(
                          movie.originalTitle,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const AppText(
                          'overview -',
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        AppText(
                          movie.overview,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const AppText(
                          'popularity -',
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        AppText(
                          movie.popularity.toString(),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const AppText(
                          'poster_path -',
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        AppText(
                          movie.posterPath,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const AppText(
                          'release_date -',
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        AppText(
                          movie.releaseDate,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const AppText(
                          'title -',
                        ),
                        const SizedBox(
                          width: 110,
                        ),
                        AppText(movie.title),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const AppText(
                          'video -',
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        AppText(
                          movie.video.toString(),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const AppText(
                          'vote_average -',
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        AppText(
                          movie.voteAverage.toString(),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const AppText(
                          'vote_count -',
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        AppText(
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
