import 'package:flutter/material.dart';

import 'action_button.dart';
import 'composer.dart';
import 'default.dart';
import 'message_bubble.dart';
import 'placeholder.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late Map<String, Widget> _routes;
  late String _content;
  late ScrollController _scrollController;

  void _handlePageContentChange(String route) {
    setState(() {
      _content = route;
    });
  }

  @override
  void initState() {
    _routes = {
      'Default': const ChatDefaultSample(),
      'Placeholder': const ChatPlaceholderSample(),
      'Composer': const ChatComposerSample(),
      'Acton Button': const ChatActionButtonSample(),
      'Message Bubble': const ChatMessageBubbleSample(),
    };
    _content = 'Default';
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Chat Samples')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: _routes[_content]!,
              ),
            ),
            Scrollbar(
              controller: _scrollController,
              child: SizedBox(
                height: 60,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(_routes.length, (int index) {
                      final String key = _routes.keys.elementAt(index);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: ActionChip(
                          label: Text(key),
                          labelPadding: const EdgeInsets.all(5.0),
                          backgroundColor:
                              _content == key ? themeData.primaryColor : null,
                          labelStyle: TextStyle(
                            color:
                                _content == key ? Colors.white : Colors.black,
                          ),
                          onPressed: () => _handlePageContentChange(key),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
