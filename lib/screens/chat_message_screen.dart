import 'package:flutter/material.dart';
import 'package:appointment_ui/models/message_model.dart';
import 'package:appointment_ui/util/color_res.dart';
import 'package:appointment_ui/util/string_res.dart';

import 'own_message_card.dart';
import 'replay_message_card.dart';

class ChatMessageScreen extends StatefulWidget {
  const ChatMessageScreen({Key key}) : super(key: key);

  @override
  _ChatMessageScreenState createState() => _ChatMessageScreenState();
}

class _ChatMessageScreenState extends State<ChatMessageScreen> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;
  List<MessageModel> messages = [
    MessageModel(
        type: 'source',
        message: 'Now I face some physical problem, can you help me.',
        time: DateTime.now().toString().substring(10, 16)),
    MessageModel(
        type: 'dest',
        message: 'Now I face some physical problem, can you help me.',
        time: DateTime.now().toString().substring(10, 16)),
  ];
  TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(
        type: type,
        message: message,
        time: DateTime.now().toString().substring(10, 16));
    print(messages);

    setState(() {
      messages.add(messageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.blue,
        appBar: AppBar(
          leadingWidth: 80,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: ColorRes.white,
                ),
                Text(
                  StringRes.back,
                  style: TextStyle(color: ColorRes.white),
                ),
              ],
            ),
          ),
          title: Text('Dr. Thomas Khushiya'),
          centerTitle: true,
          backgroundColor: ColorRes.blue,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: MediaQuery.of(context).size.height * 0.08,
                    ),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color: ColorRes.white,
                    ),
                    child: SizedBox.shrink(),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Expanded(
                    // height: MediaQuery.of(context).size.height - 150,
                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemCount: messages.length + 1,
                      itemBuilder: (context, index) {
                        if (index == messages.length) {
                          return Container(
                            height: 70,
                          );
                        }
                        if (messages[index].type == "source") {
                          return OwnMessageCard(
                            message: messages[index].message,
                            time: messages[index].time,
                          );
                        } else {
                          return ReplyCard(
                            message: messages[index].message,
                            time: messages[index].time,
                          );
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.80,
                                child: Card(
                                  elevation: 10,
                                  shadowColor: Colors.blue.shade100,
                                  margin: EdgeInsets.only(
                                      left: 20, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: TextFormField(
                                    controller: _controller,
                                    focusNode: focusNode,
                                    textAlignVertical:
                                        TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type a message",
                                      hintStyle:
                                          TextStyle(color: Colors.grey),
                                      contentPadding: EdgeInsets.all(10),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 8,
                                  right: 2,
                                  left: 2,
                                ),
                                child: Card(
                                  elevation: 10,
                                  shadowColor: Colors.blue.shade100,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(25)),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: ColorRes.white,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.send,
                                        color: ColorRes.blue,
                                      ),
                                      onPressed: () {
                                          _scrollController.animateTo(
                                              _scrollController
                                                  .position.maxScrollExtent,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.easeOut);
                                          setMessage(
                                              'source', _controller.text);
                                          _controller.clear();

                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
