import 'package:adcon/advapplymodified1.dart';
import 'package:adcon/mail.dart';
import 'package:adcon/useradd.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:adcon/advapplymodified.dart';

class advapply extends StatefulWidget {
  final dynamic advuser;
  final adv ads;
  advapply(this.advuser,this.ads);
  @override
  _advapplyState createState() => _advapplyState();
}

class _advapplyState extends State<advapply> {


  final _apply = FirebaseDatabase.instance.reference().child('apply');
  List<dynamic> l = [];

  void initState() {
    super.initState();
    _apply.onChildAdded.listen((event) {
      setState(() {
        l.add(event.snapshot.value['key1'] + " " +
            event.snapshot.value['advertiserid'] + " " +
            event.snapshot.value['Confirm'] + " " +
            event.snapshot.value['rejected']);
      });
    });
    // instaloader();
  }

  void instloader() async {


  }

  @override
  Widget build(BuildContext context) {
//     return Scaffold(
// //('addname: ${widget.ads.aid} advert: ${widget.advuser.key}'),
//       appBar: AppBar(
//         title: Text
//         // actions: [
//         //   RaisedButton(
//         //       child: Text('back'),
//         //       onPressed: (){
//         //     Navigator.pop(context);
//         //   })
//         // ],
//       ),
//       body:widget.advuser.cat=="tv"?tvwidget():otherwidget()
//
//
//
//     );
    if (widget.advuser.cat == 'tv') {
      if (l.contains(widget.ads.key + " " + widget.advuser.key + " F" + " T")) {
        return ApplyPage1(1, () {
          _apply.child(widget.ads.key + '@' + widget.advuser.key).remove();
          _apply.child(widget.ads.key + '@' + widget.advuser.key).set({
            'key1': widget.ads.key,
            'advertiserid': widget.advuser.key,
            'rate': widget.advuser.hrate,
            'Confirm': 'F',
            'rejected': 'F'
          });
          mailtoAdvertiserApply(
              widget.ads.uid, widget.ads.aid, widget.advuser.email);
          Navigator.pop(context);
        }, () {
          _apply.child(widget.ads.key + '@' + widget.advuser.key).remove();
          _apply.child(widget.ads.key + '@' + widget.advuser.key).set({
            'key1': widget.ads.key,
            'advertiserid': widget.advuser.key,
            'rate': widget.advuser.mrate,
            'Confirm': 'F',
            'rejected': 'F'
          });
          mailtoAdvertiserApply(
              widget.ads.uid, widget.ads.aid, widget.advuser.email);
          Navigator.pop(context);
        }, () {
          _apply.child(widget.ads.key + '@' + widget.advuser.key).remove();
          _apply.child(widget.ads.key + '@' + widget.advuser.key).set({
            'key1': widget.ads.key,
            'advertiserid': widget.advuser.key,
            'rate': widget.advuser.lrate,
            'Confirm': 'F',
            'rejected': 'F'
          });
          mailtoAdvertiserApply(
              widget.ads.uid, widget.ads.aid, widget.advuser.email);
          Navigator.pop(context);
        });
      }
      else
      if (l.contains(widget.ads.key + " " + widget.advuser.key + " T" + " F")) {
        return ApplyPage1(2, () {}, () {}, () {});
      }
      else
      if (l.contains(widget.ads.key + " " + widget.advuser.key + " F" + " F")) {
        return ApplyPage1(3, () {}, () {}, () {});
      }
      else {
        return ApplyPage1(4, () {
          _apply.child(widget.ads.key + '@' + widget.advuser.key).set({
            'key1': widget.ads.key,
            'advertiserid': widget.advuser.key,
            'rate': widget.advuser.hrate,
            'Confirm': 'F',
            'rejected': 'F'
          });
          mailtoAdvertiserApply(
              widget.ads.uid, widget.ads.aid, widget.advuser.email);
          Navigator.pop(context);
        }, () {
          _apply.child(widget.ads.key + '@' + widget.advuser.key).set({
            'key1': widget.ads.key,
            'advertiserid': widget.advuser.key,
            'rate': widget.advuser.mrate,
            'Confirm': 'F',
            'rejected': 'F'
          });
          mailtoAdvertiserApply(
              widget.ads.uid, widget.ads.aid, widget.advuser.email);
          Navigator.pop(context);
        }, () {
          _apply.child(widget.ads.key + '@' + widget.advuser.key).set({
            'key1': widget.ads.key,
            'advertiserid': widget.advuser.key,
            'rate': widget.advuser.lrate,
            'Confirm': 'F',
            'rejected': 'F'
          });
          mailtoAdvertiserApply(
              widget.ads.uid, widget.ads.aid, widget.advuser.email);
          Navigator.pop(context);
        });
      }
    }
    else {
      if (l.contains(widget.ads.key + " " + widget.advuser.key + " F" + " T")) {
        return ApplyPage(1, () {
          _apply.child(widget.ads.key + '@' + widget.advuser.key).remove();
          _apply.child(widget.ads.key + '@' + widget.advuser.key).set({
            'key1': widget.ads.key,
            'advertiserid': widget.advuser.key,
            'rate': widget.advuser.rate1,
            'Confirm': 'F',
            'rejected': 'F'
          });
          mailtoAdvertiserApply(
              widget.ads.uid, widget.ads.aid, widget.advuser.email);
          Navigator.pop(context);
        });
      }
      else
      if (l.contains(widget.ads.key + " " + widget.advuser.key + " T" + " F")) {
        return ApplyPage(
            2,
                () {

            }
        );
      }
      else
      if (l.contains(widget.ads.key + " " + widget.advuser.key + " F" + " F")) {
        return ApplyPage(3, () {});
      }
      else {
        return ApplyPage(4, () {
          _apply.child(widget.ads.key + '@' + widget.advuser.key).set({
            'key1': widget.ads.key,
            'advertiserid': widget.advuser.key,
            'rate': widget.advuser.rate1,
            'Confirm': 'F',
            'rejected': 'F'
          });
          mailtoAdvertiserApply(
              widget.ads.uid, widget.ads.aid, widget.advuser.email);
          Navigator.pop(context);
        });
      }
    }
  }
}
