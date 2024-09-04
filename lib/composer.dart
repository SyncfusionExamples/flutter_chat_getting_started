import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_chat/chat.dart';

class ChatComposerSample extends StatefulWidget {
  const ChatComposerSample({super.key});

  @override
  State createState() => _ChatComposerSampleState();
}

class _ChatComposerSampleState extends State<ChatComposerSample> {
  final ChatAuthor _currentUser = const ChatAuthor(
    name: 'John',
    id: '8ob3-b720-g9s6-25s8',
  );
  final ChatAuthor _incomingUser = const ChatAuthor(
    name: 'Alex',
    id: 'a2c4-56h8-9x01-2a3d',
  );
  late List<ChatMessage> _messages;

  @override
  void initState() {
    _messages = <ChatMessage>[
      ChatMessage(
        text: 'Hii! Planning a trip to the USA. Any must-see places?',
        time: DateTime.now(),
        author: _currentUser,
      ),
      ChatMessage(
        text:
            'Definitely! NYC is iconic. Don’t miss Times Square and Central Park!',
        time: DateTime.now(),
        author: _incomingUser,
      ),
      ChatMessage(
        text: 'Great! How about the West Coast?',
        time: DateTime.now(),
        author: _currentUser,
      ),
      ChatMessage(
        text: 'You gotta see Yosemite, the Grand Canyon. Breathtaking views!',
        time: DateTime.now(),
        author: _incomingUser,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfChat(
        outgoingUser: _currentUser.id,
        messages: _messages,
        composer: ChatComposer.builder(builder: (BuildContext context) {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                  onPressed: () {
                    // Handle add button press.
                  },
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Message',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          // Handle send button press.
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
