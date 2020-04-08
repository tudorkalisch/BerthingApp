import 'dart:developer';
import 'package:flutter/material.dart';
import 'available_tab.dart';
import 'package:berting_app/domain/booking.dart';
import 'package:berting_app/schedule/schedule_booking.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          accentColor: Colors.lightBlueAccent,
          primarySwatch: Colors.lightBlue,
          hintColor: Colors.white,
          brightness: Brightness.light),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              bottom: TabBar(
                labelColor: Colors.white,
                tabs: [
                  Tab(text: "Available"),
                  Tab(text: "Booked"),
                  Tab(text: "Upcoming")
                ],
              ),
              leading: Container(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          "https://scontent.fcnd1-1.fna.fbcdn.net/v/t1.0-9/p720x720/80416210_2761159237273801_6099453262308573184_o.jpg?_nc_cat=108&_nc_ohc=hIY4KlTSaKwAX-y6DYM&_nc_ht=scontent.fcnd1-1.fna&_nc_tp=6&oh=8a68ace21afee6c37574d45f52e3035c&oe=5ED6A727"))),
              title: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tudor Kalisch",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Online",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                alignment: Alignment.topLeft,
              )),
          extendBody: true,
          bottomNavigationBar: new BottomAppBar(
            shape: CircularNotchedRectangle(),
            color: Colors.lightBlue,
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              scheduleBooking(context);
            },
          ),
          body: TabBarView(
            children: [
              AvailableTab([Booking("Parking Lake Birmingham", 3.2)]),
              Text("Hello"),
              Text("Upcoming")
            ],
          ),
        ),
      ),
    );
  }

  void scheduleBooking(BuildContext context) {
    log("message");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ScheduleWidget()));
  }
}
