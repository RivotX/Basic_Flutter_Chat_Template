import 'package:flutter/material.dart';
import 'package:yes_no_app/main.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bonita'),
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://i.pinimg.com/736x/df/72/8a/df728a6276542f6405bed3d64c3c29da.jpg"),
          ),
        ),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.me)
                    ? MyMessage(message: message)
                    :  HerMessage(message: message);
              },
            ),
          ),
          MessageFieldBox(
            onValue: (value) {
              if (value.isEmpty) return;
              chatProvider.sendMessage(value);
            },
          ),
        ],
      ),
    );
  }
}
