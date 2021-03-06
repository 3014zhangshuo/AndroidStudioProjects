import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_music_player/theme.dart';
import 'package:flutter_music_player/songs.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Music Player',
      //debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: new IconButton(
          icon: new Icon(
           Icons.arrow_back_ios,
          ),
          color: const Color(0xFFDDDDDD),
          onPressed: (){}
        ),
        title: Text('Music Player'),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.menu,
            ),
            onPressed: (){},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // Seek bar

          Expanded(
            child: Center(
              child: Container(
                width: 125.0,
                height: 125.0,
                child: ClipOval(
                  clipper: new CircleClipper(),
                  child: Image.network(
                    demoPlaylist.songs[0].albumArtUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          Container(
            width: double.infinity,
            height: 125.0,
          ),

          // option + return wrap new widget
          Container(
            color: accentColor,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 50.0),
              child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: '',
                      children: [
                        TextSpan(
                          text: 'Song title\n',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4.0,
                            height: 1.5,
                          ),
                        ),
                        TextSpan(
                          text: 'Artist Name',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.75),
                            fontSize: 12.0,
                            letterSpacing: 3.0,
                            height: 1.5,
                          ),
                        ),
                      ]
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(child: Container()),
                      IconButton(
                        splashColor: lightAccentColor,
                        highlightColor: Colors.transparent,
                        icon: Icon(
                          Icons.skip_previous,
                          color: Colors.white,
                          size: 35.0,
                        ),
                        onPressed: (){
                          // TODO:
                        },
                      ),
                      Expanded(child: Container()),
                      RawMaterialButton(
                        shape: CircleBorder(),
                        fillColor: Colors.white,
                        splashColor: lightAccentColor,
                        highlightColor: lightAccentColor.withOpacity(0.5),
                        elevation: 10.0,
                        onPressed: (){
                          // TODO:
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.play_arrow,
                            color: darkAccentColor,
                            size: 35.0,
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                        splashColor: lightAccentColor,
                        highlightColor: Colors.transparent,
                        icon: Icon(
                          Icons.skip_next,
                          color: Colors.white,
                          size: 35.0,
                        ),
                        onPressed: (){
                          // TODO:
                        },
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: min(size.width, size.height) / 2,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldCliper) {
    return true;
  }
}