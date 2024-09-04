import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_chat/chat.dart';

class ChatPlaceholderSample extends StatefulWidget {
  const ChatPlaceholderSample({super.key});

  @override
  State<ChatPlaceholderSample> createState() => _ChatPlaceholderSampleState();
}

class _ChatPlaceholderSampleState extends State<ChatPlaceholderSample> {
  final ChatAuthor _currentUser = const ChatAuthor(
    name: 'Username',
    id: '8ob3-b720-g9s6-25s8',
  );

  @override
  Widget build(BuildContext context) {
    return SfChat(
      outgoingUser: _currentUser.id,
      messages: const <ChatMessage>[],
      placeholderBuilder: (BuildContext context) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(250.0)),
                  gradient: RadialGradient(
                    colors: <Color>[
                      Color.fromARGB(255, 169, 246, 172),
                      Color.fromARGB(255, 255, 247, 175),
                      Color.fromARGB(255, 250, 206, 221),
                    ],
                  ),
                ),
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Center(
                    child: Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.red,
                      size: 75,
                    ),
                  ),
                ),
              ),
              Text(
                'No messages yet!',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        );
      },
      composer: const ChatComposer(
        decoration: InputDecoration(
          hintText: 'Message',
        ),
      ),
    );
  }
}
