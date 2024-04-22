import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:my_campus/presentation/ui/utility/app_colors.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';

class FacChatScreen extends StatefulWidget {
  const FacChatScreen({super.key});

  @override
  State<FacChatScreen> createState() => _FacChatScreenState();
}

class _FacChatScreenState extends State<FacChatScreen> {
  final TextEditingController _messageTEController = TextEditingController();

  List<Message> messages = [
    Message(
        text: 'hii',
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: 'bye',
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: true),
    Message(
        text: 'ami hasan, soft eng',
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: 'owww accha.....',
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: true),
    Message(
        text: 'kamon achan?',
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: 'Hii...',
        date: DateTime.now().add(const Duration(days: 2)),
        isSentByMe: false),
    Message(
        text: 'Hii...',
        date: DateTime.now().add(const Duration(days: 2, hours: 2)),
        isSentByMe: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: GroupedListView<Message, DateTime>(
                    reverse: true,
                    order: GroupedListOrder.DESC,
                    useStickyGroupSeparators: true,
                    floatingHeader: true,
                    elements: messages,
                    groupBy: (message) => DateTime(
                        message.date.year,
                        message.date.month,
                        message.date.day,
                        message.date.hour),
                    groupHeaderBuilder: (Message message) => SizedBox(
                      height: 50,
                      child: Center(
                        child: Card(
                          color: AppColors.primaryColor.withOpacity(0.8),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              DateFormat.yMMMd().format(message.date),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    itemBuilder: (context, Message message) => SizedBox(
                      width: 250,
                      child: Align(
                        alignment: message.isSentByMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          color: Colors.teal.shade100,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(message.text),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: _messageTEController,
                        decoration:
                            const InputDecoration(hintText: 'Type Message'),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        final message = Message(
                            text: _messageTEController.text,
                            date: DateTime.now(),
                            isSentByMe: true);
                        setState(() {
                          messages.add(message);
                        });
                        _messageTEController.clear();
                      },
                      icon: const Icon(Icons.send_outlined),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;

  Message({required this.text, required this.date, required this.isSentByMe});
}
