import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:pokket_final/screens/addTransaction.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DateSelect extends StatefulWidget {
  @override
  _DateSelectState createState() => _DateSelectState();
}

class _DateSelectState extends State<DateSelect> {
  @override
  DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(Duration(days: 5));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333A47),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Calendar Timeline',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.tealAccent[100]),
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
              monthColor: Colors.white70,
              dayColor: Colors.teal[200],
              dayNameColor: Color(0xFF333A47),
              activeDayColor: Colors.white,
              activeBackgroundDayColor: Colors.redAccent[100],
              dotsColor: Color(0xFF333A47),
              selectableDayPredicate: (date) => date.day != 23,
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
            SizedBox(height: 20),
            Center(child: Text('Selected date is $_selectedDate',
                style: TextStyle(color: Colors.white))),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Center(
                child: FlatButton(
                  color: Colors.redAccent[100],
                  child: Text(
                      'VIEW RECORDS', style: TextStyle(color: Color(0xFF333A47))),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Addtransaction(selectedDate: _selectedDate.toString()))  //Navigation to view records
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[200],
        child: Icon(Icons.add,
        color: Colors.redAccent),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Addtransaction(selectedDate:_selectedDate.toString())),   //Navigation to addTransaction screen
            );
          }
      ),
    );
  }
}