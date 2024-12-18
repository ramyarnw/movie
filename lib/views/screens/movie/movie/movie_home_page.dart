import 'package:built_collection/built_collection.dart';

import '../../../../model/auth_user.dart';
import '../../../../model/movie.dart';
import '../../../../ui.dart';
import '../../../mixins/movie_mixin.dart';
import '../../../navigation/app_routes.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({super.key});

  @override
  State<MovieHomePage> createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage>
    with TickerProviderStateMixin, MovieMixin<MovieHomePage> {
  late TabController tabController;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    getData();
  }

  Future<void> getData() async {
    setState(() {
      loading = true;
    });
    await getPopularMovie();
    await getUpcoming();
    await getTopRatedMovie();
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
    final BuiltList<Movie> popular =
        context.appState.popularMovie ?? BuiltList<Movie>();
    final BuiltList<Movie> upcoming =
        context.appState.upcomingMovie ?? BuiltList<Movie>();
    final BuiltList<Movie> topRated =
        context.appState.topRatedMovie ?? BuiltList<Movie>();
    final AuthUser? user = context.appState.currentUser;
    return AppScaffold(
      appBar: ApplicationAppBar(
        leading: IconButton(
          icon: const AppIcon(Icons.menu),
          color: Colors.black,
          onPressed: () {},
        ),
        title: const AppText(
          'Book Movie',
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: const AppIcon(Icons.brightness_3),
            color: Colors.black,
            onPressed: () {},
          ),
          if (user == null)
            ElevatedButton(
                onPressed: () {
                  context.go(LoginScreenRoute().location);
                  // Navigator.push(context, MaterialPageRoute<dynamic>(
                  //     builder: (BuildContext context) {
                  //   return const LoginScreen();
                  // }));
                },
                child: const Text('Login'))
          else
            GestureDetector(
              onTap: () {
                context.go(EditProfileRoute().location);
                // Navigator.push(context,
                //     MaterialPageRoute<dynamic>(builder: (BuildContext context) {
                //   return const EditProfile();
                // }));
              },
              child: CircleAvatar(
                child: user.profile?.isNotEmpty ?? false
                    ? Image.network(user.profile!)
                    : Text(user.name.toString()),
              ),
            )
        ],
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60),
          child: TabBar(
            controller: tabController,
            dividerColor: Colors.transparent,
            tabs: const <Widget>[
              Tab(
                text: 'Popular',
                icon: Icon(Icons.movie),
              ),
              Tab(
                text: 'Top Rated',
                icon: Icon(Icons.star_rate),
              ),
              Tab(
                text: 'Explore',
                icon: Icon(Icons.upcoming),
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
                  itemCount: popular.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (BuildContext context, int index) {
                    final Movie p = popular[index];

                    return MovieTile(
                      movie: p,
                    );
                  },
                ),
                GridView.builder(
                  itemCount: upcoming.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (BuildContext context, int index) {
                    final Movie p = upcoming[index];
                    return MovieTile(
                      movie: p,
                    );
                  },
                ),
                GridView.builder(
                  itemCount: topRated.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (BuildContext context, int index) {
                    final Movie p = topRated[index];
                    return MovieTile(
                      movie: p,
                    );
                  },
                ),
              ],
            ),
    );
  }
}

//COMPONENT MOVIETILE
class MovieTile extends StatelessWidget {
  const MovieTile({
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
