import 'package:flutter/material.dart';
import 'package:appointment_ui/screens/appointment_details.dart';
import 'package:appointment_ui/util/color_res.dart';
import 'package:appointment_ui/util/string_res.dart';
import 'package:flutter/services.dart';

class MyAppointment extends StatefulWidget {
  const MyAppointment({Key key}) : super(key: key);

  @override
  _MyAppointmentState createState() => _MyAppointmentState();
}

class _MyAppointmentState extends State<MyAppointment> {
  List<Map> data = [
    {
      'title': 'Today 10 Mar 2021',
      'appointments': [
        {
          'name': 'Dr. Jacobs King',
          'isToday': true,
          'scheduleTime': '09am -10am',
          'status': 'Appointed',
        },
        {
          'name': 'Dr. Jacobs King',
          'isToday': true,
          'scheduleTime': '09am -10am',
          'status': 'Accepted',
        },
        {
          'name': 'Dr. Jacobs King',
          'isToday': true,
          'scheduleTime': '09am -10am',
          'status': 'Appointed',
        },
        {
          'name': 'Dr. Jacobs King',
          'isToday': true,
          'scheduleTime': '09am -10am',
          'status': 'Appointed',
        },
      ]
    },
    {
      'title': 'Last month',
      'appointments': [
        {
          'name': 'Dr. Jacobs King',
          'isToday': false,
          'scheduleTime': '18 Feb 2021',
          'status': 'Completed',
        },
        {
          'name': 'Dr. Jacobs King',
          'isToday': false,
          'scheduleTime': '09am -10am',
          'status': 'Completed',
        },
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // ignore: missing_return
        SystemNavigator.pop();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorRes.blue,
          appBar: AppBar(
            leadingWidth: 80,
            leading: GestureDetector(
              onTap: (){
                SystemNavigator.pop();
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
            title: Text(StringRes.myAppointment),
            centerTitle: true,
            backgroundColor: ColorRes.blue,
            elevation: 0,
          ),
          body: Column(
            children: [
              SizedBox(
                height: 50,
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
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index]['title'],
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: data[index]['appointments'].length,
                            itemBuilder: (context, i) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => AppointmentDetails(),
                                    ),
                                  );
                                },
                                child: Card(
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
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          ColorRes.blue,
                                                      radius: 12.0,
                                                      child: Icon(
                                                        Icons.call,
                                                        size: 15.0,
                                                        color: ColorRes.white,
                                                      ),
                                                    ),
                                                  ),
                                                  backgroundColor: Colors.grey,
                                                  radius: 33.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  data[index]['appointments'][i]
                                                      ['name'],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Row(
                                                  children: [
                                                    data[index]['appointments'][i]
                                                            ['isToday']
                                                        ? Icon(
                                                            Icons.schedule,
                                                            size: 15,
                                                            color: Colors.grey,
                                                          )
                                                        : Icon(
                                                            Icons
                                                                .calendar_today_outlined,
                                                            size: 15,
                                                            color: Colors.grey,
                                                          ),
                                                    Text(
                                                      '  ' +
                                                          data[index]
                                                                  ['appointments']
                                                              [i]['scheduleTime'],
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Chip(
                                            backgroundColor: Colors.blue.shade50,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            labelStyle: TextStyle(
                                                color: ColorRes.blue,
                                                fontWeight: FontWeight.bold),
                                            label: Text(
                                              data[index]['appointments'][i]
                                                  ['status'],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
