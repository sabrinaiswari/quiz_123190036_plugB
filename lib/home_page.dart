import 'package:flutter/material.dart';
import 'package:quis/detail_album.dart';
import 'package:quis/login_page.dart';

import 'top_album.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spoti-Pay"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(itemBuilder: (context,index){
        final TopAlbum album = topAlbumList[index];
        return InkWell(
          onTap:  (){
            Navigator.push(context, MaterialPageRoute(builder: (cotext){
              return DetailAlbum(Album: album.albumName);
            }));
          },
          child: Card(
            child: Row(
              children: [
                Image.network(album.imageUrls[0], width: 60,),
                Text(album.albumName),
              ],
            ),
          ),
        );
      })


    );
  }
}
