import 'package:fili/application.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashPage> {
  onNextClick() {
//    Navigator.pushNamed(context, '/camera');
    Application.router.navigateTo(context, "/player", transition: TransitionType.fadeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(),
        child: Stack(
          children: <Widget>[
            Align(
              child: Image.asset(
                'assets/images/ic_splash.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              alignment: Alignment.center,
            ),
            Align(
              child: Container(
                padding: EdgeInsets.all(56),
                child: RaisedButton(
                  color: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  padding: EdgeInsets.all(4),
                  onPressed: () {
                    this.onNextClick();
                  },
                  child: Text(
                    '下一步',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ),
              ),
              alignment: Alignment.bottomCenter,
            )
          ],
        ),
      ),
    );
  }
}
