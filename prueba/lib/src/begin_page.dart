import 'package:flutter/material.dart';
import 'package:prueba/src/sing_up_page.dart';

class BeginPage extends StatefulWidget {
  const BeginPage({Key? key}) : super(key: key);
  @override
  BeginPageState createState() => BeginPageState();
}

class BeginPageState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //home: Scaffold(
      body: Column(children: <Widget>[
        Container(
            height: 150.0,
            width: 400.0,
            //color: Colors.lightBlueAccent,
            margin: const EdgeInsets.only(left: 10.0, top: 30.0, right: 10.0),
            child: Image.asset('assets/titulo.jpg')),
        Container(
          height: 200.0,
          width: 400.0,
          //color: Colors.lightBlueAccent,
          margin: const EdgeInsets.only(left: 5.0, top: 30.0, right: 5.0),
          child: Image.asset(
            'assets/logo.png',
            width: 300,
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (BuildContext context) {
                return const SingUpPage();
              }),
            );
          },
          child: const Text(">>"),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            elevation: 5.0,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(25),
          ),
        ),
        //),
        Container(
          height: 70.0,
          width: 300.0,
          //color: Colors.lightBlueAccent,
          margin: const EdgeInsets.only(left: 5.0, top: 90.0, right: 5.0),
          child: Image.asset(
            'assets/unac.png',
          ),
        )
      ]),
    );
  }
}
