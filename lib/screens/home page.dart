import 'package:flutter/material.dart';
import '../custom widget/custom app bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height = 100.0;
  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      //appBar: CustomAppBar(height + statusBarHeight, 'Animated AppBar'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  if (height == 100) {
                    setState(() {
                      height = 200.0;
                    });
                  } else {
                    setState(() {
                      height = 100.0;
                    });
                  }
                },
                child: Text(
                  'TAP ME',
                  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      background: Paint()
                        ..color = Colors.pinkAccent.withOpacity(.5)),
                ))
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
