import 'package:adcon/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_insta/flutter_insta.dart';



//AshChanchlani
//DhruvRathee
//LinusTechTips
//tseries
//PewDiePie
//MarquesBrownlee
//sentdex
//Google

final color = kNavBarColor1;
final lightDarkGrey = Colors.white;

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(false,'snist_savage'),
//     );
//   }
// }

class Social extends StatefulWidget {
  final flag;
  final username;


  Social(this.flag,this.username);
  
  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
  final oneSec = const Duration(seconds: 1);
  Channel channelP;

  bool onGoingRequest = false;
  bool isDataAvailable = false;

  Map channelI = {};
  void fetchInstagramPost() async {
   
    FlutterInsta flutterInsta = FlutterInsta();
    await flutterInsta.getProfileData(widget.username);


    setState(() {
      channelI['username'] = flutterInsta.username;
      channelI['followers'] = flutterInsta.followers;
      channelI['following'] = flutterInsta.following;
      channelI['imgUrl'] = flutterInsta.imgurl;
      isDataAvailable = true;
      print(channelI);
    });

  }

  void fetchYouTubePost() async {
    onGoingRequest = true;
    final responseP = await http.get(Uri.parse(
        'https://www.googleapis.com/youtube/v3/channels/?part=snippet%2CcontentDetails%2Cstatistics%20&forUsername=${widget.username}&key=AIzaSyDOD_AA3DUgNZexkLXYM41F16w_7kDMk7M'));

    if (responseP.statusCode == 200) {
      setState(() {
        channelP = Channel.fromJSON(json.decode(responseP.body));
        isDataAvailable = true;
        onGoingRequest = false;
      });
    } else {
      print("error");
    }
  }

  @override
  void initState() {

    widget.flag?fetchYouTubePost():fetchInstagramPost();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightDarkGrey,
      appBar: AppBar(
        backgroundColor: color,
      ),
      body: Center(
        child:
        isDataAvailable && widget.flag?
        ChannelDetails(channelP.imgUrl,channelP.name,'Subs',channelP.subscriberCount.toString(),'Views',channelP.viewCount.toString(),'Videos',channelP.videoCount.toString(),'https://www.youtube.com/${channelP.name}'):isDataAvailable && !widget.flag?
        ChannelDetails(channelI['imgUrl'],channelI['username'],'Followers',channelI['followers'].toString(),'Following',channelI['following'].toString(),'','','https://www.instagram.com/${channelI['username']}'):
         CircularProgressIndicator(),
        /*this is an alternate widget to show loading if the data is not ready yet*/
      ),
    );
  }
}

class Channel {
  String name;
  String imgUrl;
  int subscriberCount;
  int viewCount;
  int videoCount;

  Channel(this.name, this.imgUrl, this.subscriberCount, this.viewCount,
      this.videoCount);

  factory Channel.fromJSON(Map<String, dynamic> map) {
    // print(map['items'][0]['snippet']['title']);
    return Channel(
        map['items'][0]['snippet']['title'],
        map['items'][0]['snippet']['thumbnails']['high']['url'],
        int.parse(map['items'][0]['statistics']['subscriberCount']),
        int.parse(map['items'][0]['statistics']['viewCount']),
        int.parse(map['items'][0]['statistics']['videoCount']));
  }
}

class ChannelDetails extends StatelessWidget {

  String photo;
  String header;
  String col1header;
  String col1data;
  String col2header;
  String col2data;
  String col3header;
  String col3data;
  String link;

  ChannelDetails(this.photo,this.header,this.col1header,this.col1data,this.col2header,this.col2data,this.col3header,this.col3data,this.link);

  Widget build(BuildContext c)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: 30),
            ClipRRect(
              child: Image.network(
                photo,
                // 'https://static.wikia.nocookie.net/youtube/images/8/82/AshishChanchlaniVines.jpg/revision/latest?cb=20201030073456',
                width: 100,
                height: 100,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            // SizedBox(width: 20),
            Expanded(
              child: GestureDetector(
                onTap: () async{

                  if (await canLaunch(link)) {
                    await launch(link);
                  } else {
                    throw 'Could not launch.';
                  }
                },
                child: Padding(
                  child: Text(
                    header,
                    // 'ashish chanchlani vines vines',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'GT',
                        fontSize: 25.0),
                  ),
                  padding: EdgeInsets.only(
                      top: 20.0, bottom: 20.0, right: 20.0, left: 20),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(col1header,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'GT',
                          fontSize: 20.0)),
                  SizedBox(height: 10),
                  Text(
                      col1data,
                      // '250000000',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'GT',
                          fontSize: 20.0)),
                ],
              ),
            ),
            // SizedBox(width: 30),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(col2header,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'GT',
                          fontSize: 20.0)),
                  SizedBox(height: 10),
                  Text(
                      col2data,
                      //   '2550000001',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'GT',
                          fontSize: 20.0)),
                ],
              ),
            ),
            // SizedBox(width: 30),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(col3header,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'GT',
                          fontSize: 20.0)),
                  SizedBox(height: 10),
                  Text(
                      col3data,
                      // '144',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'GT',
                          fontSize: 20.0)),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 50),
                child: Text("Source:",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'GT',
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 50),
                child: col3header==""?Text("Flutter Insta Data API",style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'GT',
                    fontSize: 16.0)):Text("YouTube Data API v3",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'GT',
                        fontSize: 16.0)),
              ),
            ),
          ],
        ),
      ],
    );
  }

}
