import 'package:flutter/material.dart';
import 'package:flutter_provider/edit_text.dart';
import 'package:flutter_provider/search_text.dart';
import 'package:flutter_provider/user_display.dart';
import 'package:flutter_provider/user_state.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        builder: (_) => UserState(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<UserState>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SearchText(),
              InputEditText(),
              RaisedButton(
                child: Text("Click to search"),
                onPressed: () => state.fetchData(),
              ),
              UserDisplay(),
            ],
          ),
        ),
      ),
    );
  }
}
