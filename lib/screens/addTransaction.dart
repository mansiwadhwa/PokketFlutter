import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Addtransaction extends StatefulWidget {
  final String selectedDate;
  Addtransaction({this.selectedDate});     //constructor

  @override
  _AddtransactionState createState() => _AddtransactionState();
}

class _AddtransactionState extends State<Addtransaction> {

  DateTime _selectedDate;
  String _transactiontitle;
  double _transactionamt;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSelectedDate();
  }
  void getSelectedDate() {
    DateTime _selectedDate = this._selectedDate;
  }
  void popup(BuildContext context){
    var alertDialog = AlertDialog(
      title: Center(child: Text("Transacion added successfully!")),
    ) ;
    showDialog(
      context: context,
      builder: (BuildContext context){
        return alertDialog;
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        centerTitle: true,
        toolbarHeight: 60.2,
        title: Text('Add Transaction'),
        elevation: 10.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft:Radius.zero, topRight: Radius.zero,bottomLeft:Radius.circular(20.0),bottomRight: Radius.circular(20.0))
        ),
      ),

      backgroundColor: Color(0xFF333A47),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 200.0,
              child: Center(
                  child: Text(
                      'Selected date : '+widget.selectedDate,
                      style: TextStyle(
                          color: Colors.white,
                        fontSize: 20.0,
                      ))),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value){
                //Do something with the user input.
                _transactiontitle = value;
              },
              decoration:InputDecoration(
                hintText: "Title",
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.teal[200], width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.teal[200], width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              )
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged:(value){
                //Do something with the user input.
                _transactionamt=value as double;
              },
              decoration: InputDecoration(
                hintText: 'Amount',
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.teal[200], width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.teal[200], width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),

            //Do something for categories wala part

            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color:Colors.teal[200],
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    // popup(context);
                    Navigator.of(context).pop("def");
                    //Implement login functionality.
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'ADD',
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}