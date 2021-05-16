import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:appointment_ui/util/color_res.dart';
import 'package:appointment_ui/util/string_res.dart';
import 'package:appointment_ui/util/widget/square_box.dart';

class ChatScreenCall extends StatefulWidget {
  const ChatScreenCall({Key key}) : super(key: key);

  @override
  _ChatScreenCallState createState() => _ChatScreenCallState();
}

class _ChatScreenCallState extends State<ChatScreenCall> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.blue,
        appBar: AppBar(
          leadingWidth: 80,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: ColorRes.black,
                  ),
                  Text(
                    StringRes.back,
                    style: TextStyle(color: ColorRes.black),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: ColorRes.white,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      color: ColorRes.white,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SquareBox(
                          containerBackground: ColorRes.blue700,
                          icon: Icon(
                            Icons.mic,
                            color: ColorRes.white,
                            size: 30,
                          ),
                          onTap: () {},
                        ),
                        SquareBox(
                          containerBackground: ColorRes.blue700,
                          icon: Icon(
                            Icons.video_call_outlined,
                            color: ColorRes.white,
                            size: 30,
                          ),
                          onTap: () {},
                        ),
                        SquareBox(
                          containerBackground: ColorRes.blue700,
                          icon: Icon(
                            Icons.volume_down,
                            color: ColorRes.white,
                            size: 30,
                          ),
                          onTap: () {},
                        ),
                        SquareBox(
                          containerBackground: ColorRes.red,
                          icon: Icon(
                            Icons.call,
                            color: ColorRes.white,
                            size: 30,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.20,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 60,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Dr. Tomas Khushiya',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '02:33',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SquareBox(
                        containerBackground: Colors.blueAccent.shade100,
                        icon: Icon(
                          Icons.file_copy_outlined,
                          size: 30,
                        ),
                        onTap: () {},
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
