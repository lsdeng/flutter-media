import 'package:flutter/material.dart';

class TodoDetailScreen extends StatefulWidget {
  TodoDetailScreen({Key key}) : super(key: key);

  @override
  _TodoDetailScreenState createState() => _TodoDetailScreenState();
}

class _TodoDetailScreenState extends State<TodoDetailScreen> {
  @override
  Widget build(BuildContext context) {
//    if (widget.todo == null) {
//      return Scaffold();
//    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  // 在这里返回 "Yep" (Pop here with "Yep"...)
                  Navigator.pop(context, 'Yep!');
                },
                child: Text(''),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  // 在这里返回 "Nope" (Pop here with "Nope")
                  Navigator.pop(context, 'Nope!');
                },
                child: Text(''),
              ),
            )
          ],
        ),
      ),
    );
  }
}
