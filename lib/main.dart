import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
          create: (context) => Info(),
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Page1(),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            child: Top(),
          ),
          Flexible(
            child: Bottom(),
          )
        ],
      ),
    );
  }
}

class Top extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var info = Provider.of<Info>(context);
    return Container(
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            child: Text('Change Values'),
            onPressed: () {
              info.changeTitle("New Title");
              info.changeDescription("My new description");
            },
          ),
          RaisedButton(
            child: Text('Next Page'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Page2(),
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var info= Provider.of<Info>(context);
    return Container(
        child: Center(
      child: RichText(
        text: TextSpan(style: TextStyle(color: Colors.black), children: [
          TextSpan(
              text: info.title, style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: ': '),
          TextSpan(text: info.description)
        ]),
      ),
    ));
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     var info= Provider.of<Info>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container( 
          child: Center(
        child: RichText(
          text: TextSpan(style: TextStyle(color: Colors.black), children: [
            TextSpan(
                text: info.title, style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ': '),
            TextSpan(text: info.description)
          ]),
        ),
      )),
    );
  }
}
