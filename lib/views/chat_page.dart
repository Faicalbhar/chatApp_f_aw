import 'package:flutter/material.dart';
import 'package:realtime_chatapp_appwrite/constants/chat_message.dart';
import 'package:realtime_chatapp_appwrite/constants/colors.dart';
import 'package:realtime_chatapp_appwrite/models/message_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // Spécifiez le type de la liste comme List<MessageModel>
  List<MessageModel> messages = [
    MessageModel(
      message: "Hello",
      sender: "101",
      receiver: "202",
      time: DateTime(2000),
      isSeenByReceiver: false,
    ),
    MessageModel(
      message: "hi",
      sender: "202",
      receiver: "101",
      time: DateTime(2000),
      isSeenByReceiver: false,
    ),
    MessageModel(
      message: "how are you?",
      sender: "101",
      receiver: "202",
      time: DateTime(2024, 1, 1),
      isSeenByReceiver: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leadingWidth: 40,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Row(
          children: [
            const CircleAvatar(),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Correction ici.
              children: const [
                Text(
                  "Other User",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Online",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) => ChatMessage(
          msg: messages[index],
          currentUser: "101",
          isImage: false,
        ),
      ),
    );
  }
}
