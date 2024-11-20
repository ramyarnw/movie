import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';

import '../../../model/cast.dart';
import '../../../model/movie.dart';
import '../../../model/tv_shows.dart';
import '../../../provider/provider_utils.dart';
import '../../widgets/movie_widgets/mixins/movie_mixin.dart';
import 'movie_detail_screen.dart';
import 'tv_detail_screen.dart';

class CastDetailScreen extends StatefulWidget {
  const CastDetailScreen({super.key, required this.id});

  final int id;

  @override
  State<CastDetailScreen> createState() => _CastDetailScreenState();
}

class _CastDetailScreenState extends State<CastDetailScreen>
    with TickerProviderStateMixin, MovieMixin {
  late TabController tabController;
  var loading = true;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    getData();
  }

  Future<void> getData() async {
    setState(() {
      loading = true;
    });
    await getCastForId(id: widget.id);
    await getMoviesOfCast(id: widget.id);
    await getTvShowsOfCast(id: widget.id);

    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BuiltList<Movie> castMovie =
        context.appState.moviesOfCast ?? BuiltList();
    final BuiltList<TvShows> castTvShow =
        context.appState.tvShowsOfCast ?? BuiltList();
    final Cast cast = context.appState.currentPicCast;
    //var cast = Cast();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 300,
        title: Column(
          children: [
            Text(
              cast.name,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.blue,
              ),
            ),
            Row(
              children: [
                Image.network(
                  cast.posterImage,
                  // width: 150,
                  height: 150,
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'adult -',
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(cast.adult.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Id -'),
                        const SizedBox(
                          width: 50,
                        ),
                        Text(cast.id.toString()),
                      ],
                    ),
                    //Text(cast.gender.toString()),
                    Row(
                      children: [
                        const Text('Dept -'),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(cast.knownForDepartment),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Name -'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(cast.name),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Org -'),
                        const SizedBox(
                          width: 40,
                        ),
                        Text(cast.originalName),
                      ],
                    ),
                    //Text(cast.popularity.toString()),
                    //Text(cast.profilePath),
                    Row(
                      children: [
                        const Text('CastId -'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(cast.castId.toString()),
                      ],
                    ),
                    // Text(cast.profilePath),
                    //Text(cast.character),
                    //Text(cast.creditId),
                    //Text(cast.order.toString()),
                  ],
                )
              ],
            )
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60),
          child: TabBar(
            controller: tabController,
            dividerColor: Colors.transparent,
            tabs: const <Widget>[
              Tab(
                text: 'Movie',
                icon: Icon(Icons.movie),
              ),
              Tab(
                text: 'TV Shows',
                icon: Icon(Icons.star_rate),
              ),
            ],
          ),
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : TabBarView(
              controller: tabController,
              children: <Widget>[
                GridView.builder(
                  itemCount: castMovie.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (BuildContext context, int index) {
                    final Movie p = castMovie[index];
                    // final image = images[index];
                    // final title = movieTitle[index];
                    return CastMovieTile(movie: p);
                    // title: title,
                    // image: image,
                    /*Image.network(
                  images[index], semanticLabel: movieTitle[index]);*/
                  },
                ),
                GridView.builder(
                  itemCount: castTvShow.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (BuildContext context, int index) {
                    final TvShows p = castTvShow[index];
                    // final image = images[index];
                    // final title = movieTitle[index];
                    return TvTile(
                      tv: p,
                      // title: title,
                      // image: image,
                    );
                    //Image.network(images[index],semanticLabel: movieTitle[index]);
                  },
                ),
              ],
            ),
    );
  }
}

//COMPONENT TVTILE
class TvTile extends StatelessWidget {
  const TvTile({
    super.key,
    required this.tv,
  });

  final TvShows tv;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return TvDetailScreen(
                id: tv.id,
              );
            }));
          },
          child: Image.network(
            tv.posterImage,
            //image,
            width: 80,
          ),
        ),
        Text(tv.name),
        //Text(title),
      ],
    );
  }
}

//cast movietile component
class CastMovieTile extends StatelessWidget {
  const CastMovieTile({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return MovieDetailScreen(
                id: movie.id,
              );
            }));
          },
          child: Image.network(
            movie.posterImage,
            //image,
            width: 80,
          ),
        ),
        Text(movie.title),
        //Text(title),
      ],
    );
  }
}
