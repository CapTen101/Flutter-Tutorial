import 'package:flutter/material.dart';
import 'chat_message.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController =
      new TextEditingController();

// _variables with underscore are automatically taken as private otherwise they are public
// (for ex: variables is public while _variables is private)

  void _onSubmitted(String text) {
    _textEditingController.clear();
    FocusScope.of(context).unfocus();
    ChatMessage message = new ChatMessage(
      text: text,
    );

    setState(() {
      _chats.insert(0, message);
    });
  }

  final List<ChatMessage> _chats = <ChatMessage>[];

  Widget _textComposerWidget() {
    return IconTheme(
      data: IconThemeData(
        color: Colors.teal,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: "Enter Message Here",
                ),
                controller: _textEditingController,
                onSubmitted: _onSubmitted,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                onPressed: () => _onSubmitted(_textEditingController.text),
                icon: Icon(
                  Icons.send_rounded,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _chats[index],
            itemCount: _chats.length,
          ),
        ),
        Divider(height: 1.0),
        Container(
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: _textComposerWidget(),
        )
      ],
    );
  }
}
