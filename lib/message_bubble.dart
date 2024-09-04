import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_chat/chat.dart';

class ChatMessageBubbleSample extends StatefulWidget {
  const ChatMessageBubbleSample({super.key});

  @override
  State createState() => _ChatMessageBubbleSampleState();
}

class _ChatMessageBubbleSampleState extends State<ChatMessageBubbleSample> {
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
    const Radius borderRadius = Radius.circular(10.0);
    final ThemeData themeData = Theme.of(context);
    return SfChat(
      outgoingUser: _currentUser.id,
      messages: _messages,
      composer: const ChatComposer(
        decoration: InputDecoration(
          hintText: 'Message',
        ),
      ),
      actionButton: ChatActionButton(
        onPressed: (String newMessage) {
          //
        },
      ),
      bubbleContentBuilder:
          (BuildContext context, int index, ChatMessage message) {
        if (message.author.id == _currentUser.id) {
          return Text(message.text);
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message.author.name,
                style: themeData.textTheme.titleSmall,
              ),
              Text(message.text),
            ],
          );
        }
      },
      bubbleFooterBuilder: (context, index, message) {
        if (message.author.id == _currentUser.id) {
          return const SizedBox();
        } else {
          return Text(
            DateFormat('d/M/y : hh:mm a').format(message.time),
            style: themeData.textTheme.bodySmall,
          );
        }
      },
      incomingBubbleSettings: const ChatBubbleSettings(
        showUserName: false,
        showTimestamp: false,
        contentBackgroundColor: Color.fromARGB(255, 186, 250, 188),
        contentShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: borderRadius,
            topRight: borderRadius,
            bottomRight: borderRadius,
          ),
        ),
      ),
      outgoingBubbleSettings: const ChatBubbleSettings(
        showUserName: false,
        showTimestamp: false,
        showUserAvatar: false,
        contentBackgroundColor: Color.fromARGB(255, 231, 230, 230),
        contentShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: borderRadius,
            topRight: borderRadius,
            bottomLeft: borderRadius,
          ),
        ),
      ),
    );
  }
}
