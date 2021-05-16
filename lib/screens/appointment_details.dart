import 'package:flutter/material.dart';
import 'package:appointment_ui/util/color_res.dart';
import 'package:appointment_ui/util/string_res.dart';
import 'chat_message_screen.dart';
import 'chat_screen_call.dart';

class AppointmentDetails extends StatefulWidget {
  const AppointmentDetails({Key key}) : super(key: key);

  @override
  _AppointmentDetailsState createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
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
                    color: ColorRes.white,
                  ),
                  Text(
                    StringRes.back,
                    style: TextStyle(color: ColorRes.white),
                  ),
                ],
              ),
            ),
          ),
          title: Text(StringRes.appointmentDetails),
          centerTitle: true,
          backgroundColor: ColorRes.blue,
          elevation: 0,
        ),
        body: Column(
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
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: ColorRes.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: SizedBox(
                                    child: CircleAvatar(
                                      radius: 40.0,
                                      foregroundColor: Colors.grey,
                                      backgroundColor: Colors.grey,
                                      child: CircleAvatar(
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: CircleAvatar(
                                            backgroundColor: ColorRes.blue,
                                            radius: 12.0,
                                            child: Icon(
                                              Icons.call,
                                              size: 15.0,
                                              color: ColorRes.white,
                                            ),
                                          ),
                                        ),
                                        backgroundColor: Colors.grey,
                                        radius: 38.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Dr. Thomas Khushiya',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          'Liver specialist',
                                          style: TextStyle(
                                            color: ColorRes.blue,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      rowItem(
                        title1: 'Name',
                        desc1: 'Josefa Maria',
                        title2: 'Age',
                        desc2: '45',
                      ),
                      rowItem(
                        title1: 'Patient Sex',
                        desc1: 'Female',
                        title2: 'Patient Id',
                        desc2: '78451K',
                      ),
                      rowItem(
                        title1: 'Date',
                        desc1: '22 Dec, 2020',
                        title2: 'Time',
                        desc2: '03:00pm - 04:00pm',
                      ),
                      rowItem(
                        title1: 'Chamber',
                        desc1: 'Modern Hospital',
                        title2: 'Room No',
                        desc2: '250',
                      ),
                      rowItem(
                        title1: 'Status',
                        desc1: 'Appointed',
                        title2: 'Fee',
                        desc2: '\$250',
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              margin: EdgeInsets.only(
                                left: 8,
                              ),
                              padding: EdgeInsets.only(left: 8, right: 8),
                              width: MediaQuery.of(context).size.width * 0.82,
                              height:
                                  MediaQuery.of(context).size.height * 0.142,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                    color: Colors.grey.shade400, width: 2.0),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            bottom: MediaQuery.of(context).size.height * 0.13,
                            child: Container(
                              color: Colors.white,
                              child: Text(
                                'Attach File (optional)',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Contact Your Doctor',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ChatMessageScreen(),
                                  ),
                                );
                              },
                              child: roundAvatar(Icons.message)),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ChatScreenCall(),
                                  ),
                                );
                              },
                              child: roundAvatar(Icons.call)),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ChatScreenCall(),
                                  ),
                                );
                              },
                              child: roundAvatar(Icons.video_call_outlined)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget roundAvatar(IconData iconData) {
    return CircleAvatar(
      backgroundColor: ColorRes.blue,
      radius: 30,
      child: Icon(
        iconData,
        color: ColorRes.white,
      ),
    );
  }

  Widget rowItem({String title1, String desc1, String title2, String desc2}) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title1,
                      style: TextStyle(color: Colors.grey, fontSize: 17),
                    ),
                    Text(
                      desc1,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title2,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      desc2,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
