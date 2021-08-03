import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:simple_animations/simple_animations.dart';


class AboutAdconsPage extends StatelessWidget {
  Widget build(BuildContext c) {
    return new MaterialApp(
        home: new Scaffold(
          backgroundColor: Color.fromRGBO(244, 243, 243, 1),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 155,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            colors: [Color(0xFFA6C3E0), Color(0xFFEBB9A0)]),
                        borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(15))),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 50),
                        IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black87,
                            ),

                            onPressed: () => {

                              Navigator.pop(c)
                            }),
                        Padding(
                          padding: EdgeInsets.only(left: 90, right: 90),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "About",
                                textAlign: TextAlign.center,
                                style:
                                TextStyle(color: Colors.black87, fontSize: 22),
                              ),
                              Text(
                                " ADCONS™",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  FadeAnimation(
                    0.7,
                    Padding(
                      padding: EdgeInsets.all(40),
                      child: Text(
                        "Adcons is a one stop solution to the advertising needs of all customers, putting forth a united front of various advertising platforms, while catering to the increasingly diverse needs of advertisers by striving to be a disruptive app-based service, enabling customers to have fair negotiations with advertisers, and setting up a brand new, enormous customer base for all advertisers.",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  FadeAnimation(
                    0.9,
                    Padding(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "OUR SERVICES",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                            SizedBox(width: 15),
                            Divider(
                              color: Colors.black,
                              height: 5,
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Image.asset("assets/images/homeimage.png",
                                  height: 140),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  FadeAnimation(
                    1.2,
                    Container(
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              AboutAdcons(
                                  "All Ads, One Roof",
                                  "Want to advertise on social media, television and print media together? Adcons is the solution.",
                                  "Left"),
                              AboutAdcons(
                                  "No Dearth of Choices",
                                  "Serving all horses for courses, find a wide variety of priced options.",
                                  "Right"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              AboutAdcons(
                                  "A Large Customer Base",
                                  "Find an enormous customer base waiting to put a word about their products forward.",
                                  "Left"),
                              AboutAdcons(
                                  "We Do The Talking!",
                                  "With the right social media APIs in place, we help you know more about advertisers' social engagement via the app.",
                                  "Right"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Divider(
                    color: Colors.black,
                    height: 5,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  SizedBox(height: 15),
                  FadeAnimation(
                    1.5,
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "Meet the Developers :",
                                textAlign: TextAlign.center,
                                style:
                                TextStyle(color: Colors.black87, fontSize: 14),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                " S. Krishna Srivatsava, Pranav N",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ));
  }
}

class AboutAdcons extends StatelessWidget {
  final String header;
  final String info;
  final String side;

  AboutAdcons(this.header, this.info, this.side);

  Widget build(BuildContext c) {
    return Expanded(
      child: Padding(
        padding: side == "Left"
            ? EdgeInsets.fromLTRB(32, 5, 18, 5)
            : EdgeInsets.fromLTRB(18, 160, 32, 5),
        child: Container(
          child: Column(
            children: <Widget>[
              Text(
                header,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                "\n\n" + info,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
          Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateY"]), child: child),
      ),
    );
  }
}