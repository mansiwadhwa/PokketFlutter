import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_range/time_range.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class BookService extends StatefulWidget {
final String serviceType;
BookService({this.serviceType});

  @override
  _BookServiceState createState() => _BookServiceState();
}

class _BookServiceState extends State<BookService> {
  @override

  DateTime _selectedDate;
  final List<DateTime> _dateList= <DateTime>[];
  final List<TimeRangeResult> _timeList =<TimeRangeResult>[];

  void addItemtoList(){
    setState(() {
      _dateList.insert(0, _selectedDate);
      _timeList.insert(0, _timeRange  );
    });
  }
  



  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(Duration(days: 10));
  }


  static const orange = Color(0xFFFE9A75);
  static const dark = Color(0xFF333A47);
  static const double leftPadding = 50;

  final _defaultTimeRange = TimeRangeResult(
    TimeOfDay(hour: 14, minute: 50),
    TimeOfDay(hour: 15, minute: 20),
  );
  TimeRangeResult _timeRange;

  String userid;
   void getprefeb()async{
          SharedPreferences prefs = await SharedPreferences.getInstance();
         var name = prefs.getString("name");
         print(name);
         setState(() {
                      userid = prefs.getString("uuid");
                  });
    }

  @override
  void initState() {
    super.initState();
    getprefeb();
     _resetSelectedDate();
    _timeRange = _defaultTimeRange;
  }

  void popup(BuildContext context){
    var alertDialog = AlertDialog(
      title: Center(child: Text("Booking Successful")),
    ) ;
    showDialog(
      context: context,
      builder: (BuildContext context){
        return alertDialog;
      }
    );
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xfaf16e7e),
          bottom:TabBar(
            tabs:[
              Tab(icon: Icon(Icons.add_circle_outline)),
              Tab(icon: Icon(Icons.receipt_outlined),)
            ]
          ),
        ),
        body: TabBarView(
          children: [

            //CALENDER TAB

            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:5, left:16),
                      child: Text(
                        'Calendar Timeline',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.teal),
                      ),
                    ),
                    CalendarTimeline(
                      showYears: true,
                      initialDate: _selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365)),
                      onDateSelected: (date) {
                        setState(() {
                          _selectedDate = date;
                        });
                      },
                      leftMargin: 20,
                      monthColor: Colors.black,
                      dayColor: Colors.teal[200],
                      dayNameColor: Color(0xFF333A47),
                      activeDayColor: Colors.black,
                      activeBackgroundDayColor: Colors.redAccent[100],
                      dotsColor: Color(0xFF333A47),
                      //selectableDayPredicate: (date) => date.day != 23,
                      locale: 'en',
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: FlatButton(
                        color: Colors.teal[200],
                        child: Text(
                            'RESET', style: TextStyle(color: Color(0xFF333A47))),
                         onPressed: () => setState(() => _resetSelectedDate()),
                       ),
                    ),
                    SizedBox(height: 5),
                    Center(child: Text('Selected date is $_selectedDate',
                        style: TextStyle(color: Colors.white))),
                    SizedBox(height: 5),

                  ],
                ),

                //TIME PICKER
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 2),
                      // child: Text(
                      //   'Opening Times',
                      //   style: Theme.of(context)
                      //       .textTheme
                      //       .headline6
                      //       .copyWith(fontWeight: FontWeight.bold, color: dark),
                      // ),
                    ),
                    SizedBox(height: 10),
                    TimeRange(
                      fromTitle: Text(
                        'FROM',
                        style: TextStyle(
                          fontSize: 14,
                          color: dark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      toTitle: Text(
                        'TO',
                        style: TextStyle(
                          fontSize: 14,
                          color: dark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      titlePadding: leftPadding,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: dark,
                      ),
                      activeTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: orange,
                      ),
                      borderColor: dark,
                      activeBorderColor: dark,
                      backgroundColor: Colors.transparent,
                      activeBackgroundColor: dark,
                      firstTime: TimeOfDay(hour: 8, minute: 00),
                      lastTime: TimeOfDay(hour: 20, minute: 00),
                      initialRange: _timeRange,
                      timeStep: 10,
                      timeBlock: 30,
                      onRangeCompleted: (range) => setState(() => _timeRange = range),
                    ),
                    SizedBox(height: 10),
                    if (_timeRange != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: leftPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Selected Range: ${_timeRange.start.format(context)} - ${_timeRange.end.format(context)}',
                              style: TextStyle(fontSize: 20, color: dark),
                            ),
                            SizedBox(height: 20),
                            // MaterialButton(
                            //   child: Text('Default'),
                            //   onPressed: () =>
                            //       setState(() => _timeRange = _defaultTimeRange),
                            //   color: orange,
                            // )
                          ],
                        ),
                      ),
                  ],
                ),


                //SUBMIT BUTTON


                RaisedButton(onPressed: (){
                  FirebaseFirestore.instance.collection("servicebooking").add({
                      "date": "_selectedDate",
                      "time": "_timeRange",
                      "service_type": widget.serviceType,
                      "uuid": userid,


                    });
                  popup(context);
                  addItemtoList();
                },
                    color: Colors.redAccent[100],
                    elevation: 5,
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'SUBMIT'
                    ))
              ],
            ),


            //RECORDS TAB



            Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: _dateList.length,
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: 400,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [0.0, 0.355, 0.864, 1.0],
                                  colors: <Color> [
                                    const Color(0xff3d4a62),
                                    const Color(0xff695369),
                                    // const Color(0xffa86073),
                                    const Color(0xffd16879),
                                    const Color(0xfaf16e7e)
                                  ],
                                ),
                              ),
                              //height: 50,
                              // margin: EdgeInsets.all(5),
                              child: Center(
                                  child:Text(
                                    "${widget.serviceType} \n"
                                    "DATE:  ${_dateList[index]}"  "\n"   "TIME:  ${_timeList[index].start.hour.toString() +":" +_timeList[index].start.minute.toString()+ " - " +
                                                                                    _timeList[index].end.hour.toString() +":" +_timeList[index].end.minute.toString()} " ,
                                    style:TextStyle(
                                      fontSize:17,
                                      color: Colors.white,
                                    ),
                                  )
                              ),
                            ),
                          );
                        }
                    ),
                  )
                ]
            ),
          ],
        ),

      ),
    );
  }
}


//${_timeList[index].start.hour.toString() +":" +_timeList[index].start.minute.toString()+ " - " +
//                                         _timeList[index].end.hour.toString() +":" +_timeList[index].end.minute.toString() }