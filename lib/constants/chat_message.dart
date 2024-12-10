import 'package:flutter/material.dart';
import 'package:realtime_chatapp_appwrite/constants/colors.dart';
import 'package:realtime_chatapp_appwrite/constants/formate_data.dart';
import 'package:realtime_chatapp_appwrite/models/message_model.dart';

class ChatMessage extends StatefulWidget {
  final MessageModel msg;
  final String currentUser;
  final bool isImage;

  const ChatMessage({
    super.key,
    required this.msg,
    required this.currentUser,
    required this.isImage,
  });

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: widget.msg.sender == widget.currentUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: widget.msg.sender == widget.currentUser
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.75),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: widget.msg.sender == widget.currentUser
                            ? Radius.circular(20)
                            : Radius.circular(2),
                        bottomRight: widget.msg.sender == widget.currentUser
                            ? Radius.circular(2)
                            : Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      widget.msg.message,
                      style: TextStyle(
                        color: widget.msg.sender == widget.currentUser
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    child: Text(
                      formatDate(widget.msg.time),
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ),
                  if (widget.msg.sender == widget.currentUser)
                    Icon(
                      Icons.check_circle_outlined,
                      size: 16,
                      color: widget.msg.isSeenByReceiver
                          ? kPrimaryColor
                          : Colors.grey,
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
