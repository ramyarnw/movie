import 'package:built_collection/built_collection.dart';

import '../../../../model/cast.dart';
import '../../../../model/movie.dart';
import '../../../../model/tv_shows.dart';
import '../../../../ui.dart';
import '../../../mixins/movie_mixin.dart';
import '../../../navigation/app_routes.dart';
import '../../../widgets/app_image.dart';

class CastDetailScreen extends StatefulWidget {
  const CastDetailScreen({super.key, required this.id});

  final int id;

  @override
  State<CastDetailScreen> createState() => _CastDetailScreenState();
}

class _CastDetailScreenState extends State<CastDetailScreen>
    with TickerProviderStateMixin, MovieMixin<CastDetailScreen> {
  late TabController tabController;
  bool loading = true;

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
        context.appState.moviesOfCast ?? BuiltList<Movie>();
    final BuiltList<TvShows> castTvShow =
        context.appState.tvShowsOfCast ?? BuiltList<TvShows>();
    final Cast cast = context.appState.currentPicCast ?? Cast();
    return AppScaffold(
      appBar: ApplicationAppBar(
        toolbarHeight: 300,
        title: Column(
          children: <Widget>[
            AppText(
              cast.name,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.blue,
              ),
            ),
            Row(
              children: <Widget>[
                AppImage.network(
                  cast.posterImage,
                  // width: 150,
                 // height: 150,
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const AppText(
                          'adult -',
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        AppText(cast.adult.toString()),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const AppText('Id -'),
                        const SizedBox(
                          width: 50,
                        ),
                        AppText(cast.id.toString()),
                      ],
                    ),
                    //Text(cast.gender.toString()),
                    Row(
                      children: <Widget>[
                        const AppText('Dept -'),
                        const SizedBox(
                          width: 20,
                        ),
                        AppText(cast.knownForDepartment),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const AppText('Name -'),
                        const SizedBox(
                          width: 10,
                        ),
                        AppText(cast.name),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const AppText('Org -'),
                        const SizedBox(
                          width: 40,
                        ),
                        AppText(cast.originalName),
                      ],
                    ),
                    //Text(cast.popularity.toString()),
                    //Text(cast.profilePath),
                    Row(
                      children: <Widget>[
                        const AppText('CastId -'),
                        const SizedBox(
                          width: 10,
                        ),
                        AppText(cast.castId.toString()),
                      ],
                    ),
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
          ? const Center(child: AppProgressIndicator())
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
                    return CastMovieTile(movie: p);
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
                    return TvTile(
                      tv: p,
                    );
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
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            context.go(TvDetailScreenRoute().location);
            // Navigator.push(context,
            //     MaterialPageRoute<dynamic>(builder: (BuildContext context) {
            //   return const TvDetailScreen();
            // }));
          },
          child: Image.network(
            tv.posterImage,
            //image,
            width: 80,
          ),
        ),
        AppText(tv.name),
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
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            context.go(MovieDetailScreenRoute(mid: movie.id).location);
            // Navigator.push(context,
            //     MaterialPageRoute<dynamic>(builder: (BuildContext context) {
            //   return MovieDetailScreen(
            //     id: movie.id,
            //   );
            // }));
          },
          child: AppImage.network(
            movie.posterImage,
            //image,
          ),
        ),
        AppText(movie.title),
        //Text(title),
      ],
    );
  }
}
