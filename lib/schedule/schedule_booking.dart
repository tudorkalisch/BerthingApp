import 'package:berting_app/schedule/calendar_view.dart';
import 'available_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScheduleWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScheduleState();
  }
}

class ScheduleState extends State<ScheduleWidget>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void navigateToNext() {
    tabController.animateTo((tabController.index + 1) % 2);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("New booking"),
            bottom: TabBar(
              controller: tabController,
              labelColor: Colors.white,
              tabs: [
                Tab(text: "Calendar"),
                Tab(text: "Time"),
                Tab(text: "Spot"),
                Tab(text: "Payment")
              ],
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: [
              CalendarView(),
              AvailableTimeWidget(),
              Text("Upcoming"),
              Text("Text1"),
            ],
          ),
          bottomNavigationBar: new BottomAppBar(
              shape: CircularNotchedRectangle(),
              color: Colors.lightBlue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      navigateToNext();
                    },
                    disabledTextColor: Colors.grey,
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
