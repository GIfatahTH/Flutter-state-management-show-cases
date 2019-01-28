import 'package:flutter/material.dart';

import './blocs/main_bloc.dart';

void main() => runApp(
      StateBuilder(
        initState: (_) => mainBloc = MainBloc(),
        dispose: (_) => mainBloc = null,
        builder: (_) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SetState management",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("State Management")),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      stateID: "Column",
      blocs: [mainBloc],
      builder: (_) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                onChanged: mainBloc.onChanged,
                decoration: InputDecoration(
                  errorText: mainBloc.errorMsg,
                ),
              ),
              Text(mainBloc.text),
            ],
          ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       StateBuilder(
  //         stateID: "TextField",
  //         blocs: [mainBloc],
  //         builder: (_) => TextField(
  //               onChanged: mainBloc.onChanged,
  //               decoration: InputDecoration(
  //                 errorText: mainBloc.errorMsg,
  //               ),
  //             ),
  //       ),
  //       StateBuilder(
  //         stateID: "Text",
  //         blocs: [mainBloc],
  //         builder: (_) => Text(mainBloc.text),
  //       ),
  //     ],
  //   );
  // }
}
