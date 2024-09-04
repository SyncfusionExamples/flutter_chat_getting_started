import 'dart:async';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_chat/chat.dart';

class ChatDefaultSample extends StatefulWidget {
  const ChatDefaultSample({super.key});

  @override
  State createState() => _ChatDefaultSampleState();
}

class _ChatDefaultSampleState extends State<ChatDefaultSample> {
  final ChatAuthor _currentUser = const ChatAuthor(
    name: 'John',
    id: '8ob3-b720-g9s6-25s8',
  );
  final ChatAuthor _incomingUser = const ChatAuthor(
    name: 'Alex',
    id: 'a2c4-56h8-9x01-2a3d',
  );
  late TextEditingController _textController;
  late FocusNode _focusNode;
  late List<ChatMessage> _predefinedMessages;
  late List<ChatMessage> _messages;

  void _writeMessage() {
    String text = _predefinedMessages[0].text;
    Timer.periodic(const Duration(milliseconds: 50), (Timer timer) {
      if (mounted) {
        _focusNode.requestFocus();
        _textController.text += text[0];
        text = text.substring(1);
        if (text.isEmpty) {
          timer.cancel();
        }
      }
    });
  }

  @override
  void initState() {
    _focusNode = FocusNode();
    _textController = TextEditingController();
    _messages = <ChatMessage>[];
    _predefinedMessages = <ChatMessage>[
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
    Timer.periodic(const Duration(milliseconds: 1500), (Timer timer) {
      timer.cancel();
      _writeMessage();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfChat(
      outgoingUser: _currentUser.id,
      messages: _messages,
      placeholderBuilder: (BuildContext context) {
        return const Center(
          child: Text(
            'No messages yet!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        );
      },
      composer: ChatComposer.builder(builder: (BuildContext context) {
        return TextField(
          focusNode: _focusNode,
          controller: _textController,
          decoration: const InputDecoration(
            hintText: 'Type a message',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
          ),
        );
      }),
      actionButton: ChatActionButton(
        onPressed: (String _) {
          setState(() {
            _messages.add(ChatMessage(
              text: _textController.text,
              time: DateTime.now(),
              author: _currentUser,
            ));
            _textController.clear();
            _focusNode.requestFocus();
            _predefinedMessages.removeAt(0);
          });
          Timer.periodic(const Duration(seconds: 1), (Timer timer) {
            setState(() {
              timer.cancel();
              if (_predefinedMessages.isNotEmpty) {
                _messages.add(_predefinedMessages.removeAt(0));
              }
            });

            if (_predefinedMessages.isEmpty) {
              return;
            }

            Timer.periodic(const Duration(seconds: 1), (Timer timer) {
              _writeMessage();
              timer.cancel();
            });
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
