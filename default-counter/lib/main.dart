import 'package:flutter/material.dart';

import './blocs/main_bloc.dart';

void main() => runApp(
      // Blocs are provided by instantiating them in initState() fo a statefullWidget
      // and destroying them in dispose() method. They can be provided using the inheritedWidget
      StateBuilder(
        initState: (_) => mainBloc =
            MainBloc(), // initializing mainBloc. It will be availible to all widgets underdeath; that is All the app.
        dispose: (_) => mainBloc =
            null, //// destroying the mainBloc object to free resources
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("State Management")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            StateBuilder(
              stateID: "CounterText",
              blocs: [mainBloc],
              builder: (_) => Text('${mainBloc.counter}',
                  style: Theme.of(context).textTheme.display1),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: mainBloc.incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
