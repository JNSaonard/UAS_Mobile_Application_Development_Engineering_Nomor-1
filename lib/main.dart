import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('UAS Mobile Application Development Engineering_Nomor 1'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<Counter>(
                builder: (context, counter, child) {
                  return Text(
                    'Count: ${counter.count}',
                    style: TextStyle(fontSize: 24),
                  );
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<Counter>(context, listen: false).increment();
                    },
                    child: Text('+'), //Increment (1)
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<Counter>(context, listen: false).decrement();
                    },
                    child: Text('-'), //Decrement (-1)
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
