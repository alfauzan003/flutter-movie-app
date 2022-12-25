import 'package:flutter/material.dart';
import '/api/endpoints.dart';
import '/constants/api_constants.dart';
import '/modal_class/movie.dart';
import '/screens/widgets.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie movie;
  final String heroId;

  MovieDetailPage({required this.movie, required this.heroId});

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff1F1F1F),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff131834),
                            Color(0xffc1071e),
                          ],
                        ),
                      ),
                    ),
                    Image(
                      image: NetworkImage(TMDB_BASE_IMAGE_URL +
                          'original/' +
                          widget.movie.backdropPath!),
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color(0xffF5C518),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: Stack(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 75, 16, 16),
                          child: Card(
                            color: Color(0xff141414),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),

                            child: Column(
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(top: 30)),
                                Positioned(
                                  top: 0,
                                  left: 40,
                                  child: Hero(
                                    tag: widget.heroId,
                                    child: SizedBox(
                                      width: 100,
                                      height: 150,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: widget.movie.posterPath == null
                                            ? Image.asset(
                                                'assets/images/na.jpg',
                                                fit: BoxFit.cover,
                                              )
                                            : FadeInImage(
                                                image: NetworkImage(
                                                    TMDB_BASE_IMAGE_URL +
                                                        'w500/' +
                                                        widget
                                                            .movie.posterPath!),
                                                fit: BoxFit.cover,
                                                placeholder: AssetImage(
                                                    'assets/images/loading.gif'),
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.movie.title!,
                                      style: TextStyle(
                                          fontFamily: 'Sans',
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffffffff),
                                          fontSize: 20),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                Padding(padding: const EdgeInsets.all(5.0)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Rating ',
                                        style: TextStyle(
                                            fontFamily: 'Sans',
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffffffff),
                                            fontSize: 16),
                                      ),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Text(
                                      widget.movie.voteAverage!,
                                      style: TextStyle(
                                          fontFamily: 'Sans',
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffffffff),
                                          fontSize: 16),
                                    ),
                                    Text(
                                      '/10 ',
                                      style: TextStyle(
                                          fontFamily: 'Sans',
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffffffff),
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                'Synopsis',
                                                style: TextStyle(
                                                    fontFamily: 'Sans',
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xffffffff),
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            widget.movie.overview!,
                                            style: TextStyle(
                                                fontFamily: 'Sans',
                                                fontWeight: FontWeight.normal,
                                                color: Color(0xffffffff),
                                                fontSize: 14),
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, bottom: 4.0),
                                              child: Text(
                                                'Release date : ${widget.movie.releaseDate}',
                                                style: TextStyle(
                                                    fontFamily: 'Sans',
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xffffffff),
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                        ScrollingArtists(
                                          api: Endpoints.getCreditsUrl(
                                              widget.movie.id!),
                                          title: 'Cast',
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
