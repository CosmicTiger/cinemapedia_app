import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Loading movies 🎥',
      'Preparing PopCorns 🍿',
      'Loading popular movies 💠',
      'Calling my partner 💞',
      'Almost there 🏃',
      'God Dang it! I am slow ☹️',
      'I am not a robot 🤖',
    ];

    return Stream<String>.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Wait please"),
        const SizedBox(height: 10),
        const CircularProgressIndicator(
          strokeWidth: 2,
        ),
        const SizedBox(height: 10),
        StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Text('Loading');
              }

              return Text(snapshot.data!);
            }),
      ],
    ));
  }
}
