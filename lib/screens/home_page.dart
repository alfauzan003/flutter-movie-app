import 'package:flutter/material.dart';
import 'login_page.dart';
import '../api/endpoints.dart';
import 'movie_detail.dart';
import 'widgets.dart';
import '/modal_class/movie.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  signOut() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Project Prak Mobile',
          style: TextStyle(
              fontFamily: 'Sans',
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
              fontSize: 24),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.logout_rounded),
              onPressed: () {
                setState(() {
                  //add
                  signOut();
                });
              })
        ],
        backgroundColor: Color(0xffc1071e),
      ),
      body: Container(
        color: Color(0xff1F1F1F),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            DiscoverMovies(),
            ScrollingMovies(
              title: 'Top Rated',
              api: Endpoints.topRatedUrl(1),
            ),
            ScrollingMovies(
              title: 'Now Playing',
              api: Endpoints.nowPlayingMoviesUrl(1),
            ),
            ScrollingMovies(
              title: 'Popular',
              api: Endpoints.popularMoviesUrl(1),
            ),
          ],
        ),
      ),
    );
  }
}
