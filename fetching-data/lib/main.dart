import 'dart:math';
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
        stateID: "ListView",
        blocs: [mainBloc],
        initState: (_) => mainBloc.fetchList(),
        builder: (_) => mainBloc.listIsLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: mainBloc.items.length,
                itemBuilder: (_, index) => StateBuilder(
                      builder: (state) => ListTile(
                            title: Text(
                                "This is item number  ${Random().nextInt(100)}"),
                            trailing: Text(" ${mainBloc.items[index]}"),
                            onTap: () => mainBloc.decrement(index, state),
                          ),
                    ),
              ));
  }
}

// SECOND CASE
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StateBuilder(
//         stateID: "ListView",
//         blocs: [mainBloc],
//         initState: (_) => mainBloc.fetchList(),
//         builder: (_) => mainBloc.listIsLoading
//             ? Center(child: CircularProgressIndicator())
//             : ListView.builder(
//                 itemCount: mainBloc.items.length,
//                 itemBuilder: (_, index) => ListTile(
//                       title: Text( "This is item number  ${Random().nextInt(100)}"),
//                       trailing: Text(" ${mainBloc.items[index]}"),
//                       onTap: () => mainBloc.decrement(index),
//                     ),
//               ));
//   }
// }

//  // FIRST CASE
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StateBuilder(
//         initState: (state) => mainBloc.fetchList(state),
//         builder: (_) => mainBloc.listIsLoading
//             ? Center(child: CircularProgressIndicator())
//             : ListView.builder(
//                 itemCount: mainBloc.items.length,
//                 itemBuilder: (_, index) => ListTile(
//                       title: Text( "This is item number  ${Random().nextInt(100)}"),
//                       trailing: Text(" ${mainBloc.items[index]}"),
//                       onTap: () => mainBloc.decrement(index),
//                     ),
//               ));
//   }
// }

// // BEFORE;
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return mainBloc.listIsLoading
//         ? Center(child: CircularProgressIndicator())
//         : ListView.builder(
//             itemCount: mainBloc.items.length,
//             itemBuilder: (_, index) => ListTile(
//                   title: Text( "This is item number  ${Random().nextInt(100)}"),
//                   trailing: Text(" ${mainBloc.items[index]}"),
//                   onTap: () => mainBloc.decrement(index),
//                 ),
//           );
//   }
// }
