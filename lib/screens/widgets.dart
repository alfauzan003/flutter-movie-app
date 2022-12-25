import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '/api/endpoints.dart';
import '/constants/api_constants.dart';
import '/modal_class/credits.dart';
import '/modal_class/function.dart';
import '/modal_class/movie.dart';
import '/screens/movie_detail.dart';

class DiscoverMovies extends StatefulWidget {
  DiscoverMovies();
  @override
  _DiscoverMoviesState createState() => _DiscoverMoviesState();
}

class _DiscoverMoviesState extends State<DiscoverMovies> {
  List<Movie>? moviesList;
  @override
  void initState() {
    super.initState();
    fetchMovies(Endpoints.discoverMoviesUrl(1)).then((value) {
      setState(() {
        moviesList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Discover',
                  style: TextStyle(
                      fontFamily: 'Sans',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24)),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          height: 350,
          child: moviesList == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : CarouselSlider.builder(
                  options: CarouselOptions(
                    disableCenter: true,
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                  ),
                  itemBuilder:
                      (BuildContext context, int index, pageViewIndex) {
                    return Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetailPage(
                                      movie: moviesList![index],
                                      heroId:
                                          '${moviesList![index].id}discover')));
                        },
                        child: Hero(
                          tag: '${moviesList![index].id}discover',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image(
                              image: NetworkImage(TMDB_BASE_IMAGE_URL +
                                  'w500/' +
                                  moviesList![index].posterPath!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: moviesList!.length,
                ),
        ),
      ],
    );
  }
}

class ScrollingMovies extends StatefulWidget {
  final String? api, title;
  ScrollingMovies({this.api, this.title});
  @override
  _ScrollingMoviesState createState() => _ScrollingMoviesState();
}

class _ScrollingMoviesState extends State<ScrollingMovies> {
  List<Movie>? moviesList;
  @override
  void initState() {
    super.initState();
    fetchMovies(widget.api!).then((value) {
      setState(() {
        moviesList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.title!,
                  style: TextStyle(
                      fontFamily: 'Sans',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24)),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          height: 200,
          child: moviesList == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: moviesList!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetailPage(
                                      movie: moviesList![index],
                                      heroId:
                                          '${moviesList![index].id}${widget.title}')));
                        },
                        child: Hero(
                          tag: '${moviesList![index].id}${widget.title}',
                          child: SizedBox(
                            width: 100,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image(
                                      image: NetworkImage(TMDB_BASE_IMAGE_URL +
                                          'w500/' +
                                          moviesList![index].posterPath!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    moviesList![index].title!,
                                    style: TextStyle(
                                        fontFamily: 'Sans',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class ScrollingArtists extends StatefulWidget {
  // final ThemeData? themeData;
  final String? api, title, tapButtonText;
  final Function(Cast)? onTap;
  ScrollingArtists({this.api, this.title, this.tapButtonText, this.onTap});
  @override
  _ScrollingArtistsState createState() => _ScrollingArtistsState();
}

class _ScrollingArtistsState extends State<ScrollingArtists> {
  Credits? credits;
  @override
  void initState() {
    super.initState();
    fetchCredits(widget.api!).then((value) {
      setState(() {
        credits = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        credits == null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      widget.title!,
                      style: TextStyle(
                          fontFamily: 'Sans',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ],
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.title!,
                      style: TextStyle(
                          fontFamily: 'Sans',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
        SizedBox(
          width: double.infinity,
          height: 120,
          child: credits == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: credits!.cast!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: SizedBox(
                          width: 80,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: SizedBox(
                                  width: 70,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: credits!.cast![index].profilePath ==
                                            null
                                        ? Image.asset(
                                            'assets/images/na.jpg',
                                            fit: BoxFit.cover,
                                          )
                                        : Image(
                                            image: NetworkImage(
                                                TMDB_BASE_IMAGE_URL +
                                                    'w500/' +
                                                    credits!.cast![index]
                                                        .profilePath!),
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  credits!.cast![index].name!,
                                  style: TextStyle(
                                      fontFamily: 'Sans',
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                      fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
