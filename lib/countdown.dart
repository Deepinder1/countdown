import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:countdown_flutter/countdown_flutter.dart';

void main() => runApp(Countdown());

class Countdown extends StatefulWidget {
  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  var _done = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_done ? 'Finished!' : 'Counting...'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Center(
              child: CountdownFormatted(
                duration: Duration(hours: 1),
                builder: (BuildContext ctx, String remaining) {
                  return Text(
                    remaining,
                    style: TextStyle(fontSize: 30),
                  ); // 01:00:00
                },
              ),
            ),
            RaisedButton(
              color: Colors.green,
              padding: EdgeInsets.symmetric(
                horizontal: 35.0,
                vertical: 12.0,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Stop',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
