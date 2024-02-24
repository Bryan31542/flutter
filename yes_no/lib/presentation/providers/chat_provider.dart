import 'package:flutter/material.dart';
import 'package:yes_no/config/helpers/get_answer.dart';
import 'package:yes_no/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
  ];

  Future<void> sendMessage(String text) async {

    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);

    messageList.add(newMessage);

    if (text.endsWith("?")) {
      reply();
    }

    // notifyListeners() will notify all the listeners of the change
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> reply() async {
    final message = await getYesNoAnswer.getAnswer();
    messageList.add(message);
    notifyListeners();

    moveScrollToBottom();
  }

  void moveScrollToBottom() async {

    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
    );
  }
}
