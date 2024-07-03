import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:my_campus/presentation/ui/utility/app_colors.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../../../../../state_holders/faculty_state_holders/fac_show_chats_state_holders.dart';
import '../../../../../state_holders/faculty_state_holders/group_chatting_controller.dart';

class FacChatScreen extends StatefulWidget {
  const FacChatScreen(
      {super.key,
      required this.batch,
      required this.courseCode,
      required this.courseTitle,
      required this.groupID,
      required this.senderID});

  final String batch, courseCode, courseTitle, groupID, senderID;

  @override
  State<FacChatScreen> createState() => _FacChatScreenState();
}

class _FacChatScreenState extends State<FacChatScreen> {
  final TextEditingController _messageTEController = TextEditingController();

  List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.courseCode,
              style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1),
            ),
            Text(
              widget.courseTitle,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.2),
            ),
          ],
        ),
        actions: [
          Text(
            '\nBatch: ${widget.batch}  ',
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, letterSpacing: 0.1),
          ),
        ],

        //centerTitle: true,
        backgroundColor: AppColors.primaryColor.withOpacity(0.7),
        elevation: 0.5,
      ),
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GetBuilder<FacShowChatsController>(
                  builder: (facShowChatsController) {
                print(
                    facShowChatsController.facChatData.chat?.length ?? 'null');
                return SizedBox(
                  height: 500,
                  child: ListView.builder(
                    itemCount:
                        facShowChatsController.facChatData.chat?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(facShowChatsController
                            .facChatData.chat![index].message
                            .toString()),
                      );
                    },
                  ),
                );

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
                );
              }),
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
                  GetBuilder<GroupChattingController>(
                      builder: (groupChattingController) {
                    return IconButton(
                      onPressed: () async {
                        print('tapped');
                        final result = await groupChattingController.groupChat(
                            widget.groupID,
                            widget.senderID,
                            _messageTEController.text,
                            'me',
                            DateTime.now().toString());

                        if (result) {
                          Get.snackbar('Successful!', 'msg sent');
                        } else {
                          Get.snackbar('Failed!', "Couldn't send msg!!",
                              colorText: Colors.redAccent);
                        }

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
                    );
                  }),
                ],
              ),
            ],
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
/*

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../../state_holders/faculty_state_holders/fac_show_chats_state_holders.dart';

class FacChatScreen extends StatefulWidget {
  const FacChatScreen(
      {super.key,
      required this.batch,
      required this.courseCode,
      required this.courseTitle,
      required this.groupID,
      required this.senderID});

  final String batch, courseCode, courseTitle, groupID, senderID;

  @override
  State<FacChatScreen> createState() => _FacChatScreenState();
}

class _FacChatScreenState extends State<FacChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: GetBuilder<FacShowChatsController>(
        builder: (facShowChatsController) {
          return ListView.builder(
            itemCount: facShowChatsController.facChatData.chat?.length ?? 0,
            itemBuilder: (context, index) {
              return ExpansionTile(
                title: Text(facShowChatsController
                    .facChatData.chat![index].message
                    .toString()),
              );
            },
          );
        },
      ),
    );
  }
}
*/
