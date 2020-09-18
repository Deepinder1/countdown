import 'package:countdown/countdown.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int of hr, min and sec
  int hour = 0;
  int min = 0;
  int sec = 0;

  //for displaying time
  // Widget timeToDisplay;

  //creating boolean for start and stop button
  bool started = true;
  bool stoped = true;

  //setting bool cancel timer
  bool cancelTimer = false;

  //creating an int for calculating time
  int timefortimer;
  //creating duration to pass in timer
  final dur = const Duration(seconds: 1);

  //start and stop simple logic
  // Widget start() {
  //   return
  // }

  void stop() {}

  Widget timer() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'HH',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    NumberPicker.integer(
                      initialValue: hour,
                      minValue: 0,
                      maxValue: 23,
                      listViewWidth: 60.0,
                      onChanged: (value) {
                        setState(() {
                          hour = value;
                        });
                      },
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'MM',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    NumberPicker.integer(
                      initialValue: min,
                      minValue: 0,
                      maxValue: 59,
                      listViewWidth: 60.0,
                      onChanged: (value) {
                        setState(() {
                          min = value;
                        });
                      },
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'SS',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    NumberPicker.integer(
                      initialValue: sec,
                      minValue: 0,
                      maxValue: 59,
                      listViewWidth: 60.0,
                      onChanged: (value) {
                        setState(() {
                          sec = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Expanded(
          //   flex: 1,
          //   child: timeToDisplay,
          // ),
          // child: Text(
          //   timeToDisplay,
          //   style: TextStyle(
          //     fontSize: 40.0,
          //     fontWeight: FontWeight.w700,
          //   ),
          // ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  color: Colors.green,
                  padding: EdgeInsets.symmetric(
                    horizontal: 35.0,
                    vertical: 12.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Countdown()),
                    );
                    // setState(() {
                    //   started = false;
                    // });
                  },
                  child: Text(
                    'Start',
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Watch',
          ),
          bottom: TabBar(
            tabs: [
              Text('Timer'),
              Text('StopWatch'),
            ],
            labelStyle: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
            labelPadding: EdgeInsets.only(
              bottom: 10.0,
            ),
            unselectedLabelColor: Colors.white60,
          ),
        ),
        body: TabBarView(children: [
          timer(),
          Text('StopWatch'),
        ]),
      ),
    );
  }
}
