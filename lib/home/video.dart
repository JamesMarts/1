import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new VideoPageState();
  }
}

class VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("视频"),
          actions: <Widget>[new Container()],
        ),
        body: new Center(
          child: null,
        ),
      ),
    );
  }
}
