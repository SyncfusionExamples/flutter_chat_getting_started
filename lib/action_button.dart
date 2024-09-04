import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_chat/chat.dart';

class ChatActionButtonSample extends StatefulWidget {
  const ChatActionButtonSample({super.key});

  @override
  State createState() => _ChatActionButtonSampleState();
}

class _ChatActionButtonSampleState extends State<ChatActionButtonSample> {
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
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SfChat(
        outgoingUser: _currentUser.id,
        messages: _messages,
        composer: const ChatComposer(
          decoration: InputDecoration(
            hintText: 'Message',
          ),
        ),
        actionButton: ChatActionButton(
          onPressed: (String newMessage) {
            // Add your action here.
          },
          size: const Size(150, 40),
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                IconButton.filled(
                  icon: Icon(Icons.attach_file, color: colorScheme.onPrimary),
                  color: colorScheme.primary,
                  onPressed: () {
                    // Add your action here.
                  },
                ),
                const SizedBox(width: 10),
                IconButton.filled(
                  icon: Icon(Icons.mic, color: colorScheme.onPrimary),
                  color: colorScheme.onPrimary,
                  onPressed: () {
                    // Add your action here.
                  },
                ),
                const SizedBox(width: 10),
                IconButton.filled(
                  icon: Icon(Icons.send, color: colorScheme.onPrimary),
                  color: colorScheme.onPrimary,
                  onPressed: () {
                    // Add your action here.
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
