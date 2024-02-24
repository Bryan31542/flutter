import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no/domain/entities/message.dart';
import 'package:yes_no/presentation/providers/chat_provider.dart';
import 'package:yes_no/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: 
            CircleAvatar(
            backgroundImage: NetworkImage(
                'https://media.licdn.com/dms/image/C5603AQEOdH31C5KVtQ/profile-displayphoto-shrink_800_800/0/1617307014055?e=2147483647&v=beta&t=fFkH-VhX6_J3qmFVXh5e_DyPLzU5m6ZoOcndR6aaQ8I'),
          ),
        ),
        title: const Text('Leana <3'),
        centerTitle: false,
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];

                      return (message.fromWho == FromWho.other)
                          ? HerMessageBubble(message: message)
                          : MyMessageBubble(message: message);
                    })),
            MessageFieldBox(
              onValue: chatProvider.sendMessage
            ),
          ],
        ),
      ),
    );
  }
}
