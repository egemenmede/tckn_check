import 'package:flutter/material.dart';
import 'package:tckn_check/tckn_check.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TCKN Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'TCKN Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _tcknStatus = false;
  String _tcknExample = "00000000000";

  void _trueTckn() {
    setState(() {
      _tcknStatus = Tckn().check("62468678658");
      _tcknExample = "62468678658";
    });
  }

  void _falseTckn() {
    setState(() {
      _tcknStatus = Tckn().check("6468678658");
      _tcknExample = "6468678658";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Example TCKN: $_tcknExample',
            ),
            Text(
              'TCKN Check: $_tcknStatus',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Wrap( //will break to another line on overflow
        direction: Axis.horizontal, //use vertical to show  on vertical axis
        children: [
          Container(
              margin:const EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: _trueTckn,
                tooltip: 'Example',
                child: const Icon(Icons.check),
                backgroundColor: Colors.green,
              )
          ), //button first

          Container(
              margin:const EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: _falseTckn,
                tooltip: 'Example',
                child: const Icon(Icons.error),
                backgroundColor: Colors.red,
              )
          ), // button second
        ],
      ),


    );
  }
}
