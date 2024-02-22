import 'package:flutter/material.dart';
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
          child: CircleAvatar(
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return (index % 2 == 0) ? const HerMessageBubble() : const MyMessageBubble();
           
                    })),
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
