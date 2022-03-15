import 'package:quis/login_page.dart';
import 'package:flutter/material.dart';

import 'top_album.dart';

class DetailAlbum extends StatelessWidget {
  final String Album;
  String albumName;
  String singer;
  String releaseDate;
  String firstEntryDate;
  String firstEntryPosition;
  String source;
  String imageUrls;
  String albumurl;
  List<String> songs;

  const DetailAlbum({
    Key? key,
    required this.Album,
    required this.albumName,
    required this.singer,
    required this.releaseDate,
    required this.firstEntryDate,
    required this.firstEntryPosition,
    required this.source,
    required this.imageUrls,
    required this.albumurl,
    required this.songs,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Album'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              children:[
              Image.network(imageUrls),
                SizedBox(height: 12,),
                Text(albumName,style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 12,),
                Text(singer, style: TextStyle(fontWeight: FontWeight.bold),),
                Text(releaseDate, style: TextStyle(fontWeight: FontWeight.bold), ),
                Text(songs,style: TextStyle(fontWeight: FontWeight.bold), ),
            ]
          ),
        )
      ),
    );
  }
}
