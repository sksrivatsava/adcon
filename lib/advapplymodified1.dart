import 'package:flutter/material.dart';
import 'constants.dart';



class ApplyPage1 extends StatelessWidget {
  final flag;
  Function press1;
  Function press2;
  Function press3;



  //flag = 1 apply again
  //flag = 2 confirmed
  //flag = 3 applied
  //flag = 4 apply

  ApplyPage1(this.flag, this.press1,this.press2,this.press3);

  Widget build(BuildContext c) {
    return new MaterialApp(
        home: new Scaffold(
          backgroundColor: Color.fromRGBO(244, 243, 243, 1),
          appBar: AppBar(
            backgroundColor: kCategoryPageColor,
            brightness: Brightness.light,
            elevation: 0,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black87,
                ),
                onPressed: () => {Navigator.pop(c)}),
            /*change the above function definition for the BACK functionality*/
          ),
          body: Container(
              child: flag==1? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ApplyTop("Your previous application with this advertiser has been rejected. Would you like to apply again?"),
                  SizedBox(height: 20),
                  ApplyButton("Apply Again",press1,press2,press3),
                ],
              ):flag==2? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ApplyTop("Hurray! Your application has been confirmed!\nPlease visit the Confirmed Applications Tab to submit your ad's draft link."),
                  SizedBox(height: 20),

                ],
              ):flag==3? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ApplyTop("You have already applied to this advertiser!"),
                  SizedBox(height: 20),

                ],
              ):Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ApplyTop("Would you like to apply to this advertiser?"),
                  SizedBox(height: 20),
                  ApplyButton("Submit Application",press1,press2,press3),
                ],
              )
          ),
        ));
  }
}

class ApplyTop extends StatelessWidget {
  String ApplyString = "null";

  ApplyTop(String ApplyString) {
    this.ApplyString = ApplyString;
  }

  Widget build(BuildContext c) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: kCategoryPageColor,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            ApplyString,
            style: TextStyle(color: Colors.black87, fontSize: 25),
          ),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}

class ApplyButton extends StatelessWidget {
  final  ButtonString;
  Function press1;
  Function press2;
  Function press3;

  ApplyButton(this.ButtonString,this.press1,this.press2,this.press3);

  Widget build(BuildContext c) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Color.fromRGBO(244, 243, 243, 1),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: press1,
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), color: Color(0xFF5aa4ed)),
                child: Center(
                  child: Text(
                    "High Trp ${ButtonString}",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: press2,
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), color: Color(0xFF5aa4ed)),
                child: Center(
                  child: Text(
                    "Medium Trp ${ButtonString}",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: press3,
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), color: Color(0xFF5aa4ed)),
                child: Center(
                  child: Text(
                    "Low Trp ${ButtonString}",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
