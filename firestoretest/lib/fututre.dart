// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';

class FuturePage extends StatelessWidget {
  final StreamController streamController = StreamController();

  Future<void> getInfo() async {
    await Future.delayed(Duration(seconds: 3), () {
      print("This is a message that will come after 3 seconds");
      return 4;
    });
    await Future.delayed(Duration(seconds: 2), () {
      print("This is a message that will come after 2  ");
    });

    print("This is a normal text");
  }

  void getStream() async {
    streamController.stream.listen((event) {
      print(event);
    });

    for (int i = 0; i < 4; i++) {
      streamController.add('you got a message');
      await Future.delayed(Duration(seconds: 2), () {
        print('read the message');
      });
    }
  }

  Future<String> getString() async {
    final userText = await Future.delayed(Duration(seconds: 4), () {
      return "Success";
    });
    return userText;
  }

  Stream getMyStream() async* {
    for (int i = 0; i <= 10; i++) {
      yield i;
      await Future.delayed(Duration(seconds: 2));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          streamController.add("event");
        },
        child: const Text("add"),
      ),
      body: Center(
        child: StreamBuilder(
          stream: getMyStream(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data.toString(),
                style: TextStyle(
                  fontSize: 40,
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
