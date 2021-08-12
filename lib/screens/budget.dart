import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/services.dart';
import 'package:pokket_final/screens/addTransaction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';


class BudgetPage extends StatefulWidget {

  @override
  _BudgetPageState createState() => _BudgetPageState();
}


class _BudgetPageState extends State<BudgetPage> {
  @override

  DateTime _selectedDate;
  String _transactiontitle;
  double _transactionamt;
  double _balance;
  String userid;
  TextEditingController _transactionamtController= TextEditingController();

   void getprefeb()async{
          SharedPreferences prefs = await SharedPreferences.getInstance();
         var name = prefs.getString("name");
         print(name);
         setState(() {
                      userid = prefs.getString("uuid");
                  });
    }



  final List<String> _transactionTitleList =<String>[];
  final List<double> _transctionAmtList =<double>[];
  final List<DateTime> _selecteddateList =<DateTime>[];


  void addItemtoList(){
    setState(() {
      _selecteddateList.insert(0, _selectedDate);
      _transactionTitleList.insert(0, _transactiontitle  );
      _transctionAmtList.insert(0,_transactionamt);
    });
  }

  @override
  void initState() {
    super.initState();
    getprefeb();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(Duration(days: 10));
  }


  //Function for show ModalBottomSheet
  void addTranscation(context){
    showModalBottomSheet(
        context: context,
        elevation: 8.0,
        builder: (BuildContext bc){
          return Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        //height: 200.0,
                        child: Center(
                            child: Text(
                                'Selected date : $_selectedDate',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20.0,
                                ))),
                      ),
                      SizedBox(
                        height: 10.0,
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
                          _transactionamt = double.parse('$value');
                         
                          // print("transaction is" + _transactionamtController.text);
                          // print("value is" + value);
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
                        height: 10.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Material(
                          color:Colors.teal[200],
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          elevation: 5.0,
                          child: MaterialButton(
                            onPressed: () {
                              print(_transactionamt);
                              FirebaseFirestore.instance.collection("transation").add({
                      "date": _selectedDate,
                      "Transaction_amount": _transactionamt,
                      "transaction_date" : _selectedDate,
                      "title": _transactiontitle,

                      "remaining balance": (_balance-_transactionamt),
                      "uuid": userid,
                    });
                              Navigator.pop(context);
                              addItemtoList();
                              _balance= _balance- _transactionamt;
                              
                            },
                            minWidth: 200.0,
                            height: 10.0,
                            child: Text(
                              'ADD',
                            ),
                          ),
                        ),
                      ),
                    ]
                ),
              )

          );
        });
  }


  //Change Budget
  void updateBudget(context){
    showModalBottomSheet(
        context: context,
        elevation: 8.0,
        builder: (BuildContext bc){
          return Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        //height: 200.0,
                        child: Center(
                            child: Text(
                                'Current Balance: $_balance',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20.0,
                                ))),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                          onChanged: (value){
                            //Do something with the user input.
                            setState(() {
                              
                              _balance = double.parse('$value');
                            });
                          },
                          decoration:InputDecoration(
                            hintText: "New Budget",
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

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Material(
                          color:Colors.teal[200],
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          elevation: 5.0,
                          child: MaterialButton(
                            onPressed: () {
                              FirebaseFirestore.instance.collection("users").doc(userid).update({
                             "budget": _balance,
                             
                      // "time": _timeRange,
                      // "service_type": serviceType,
                      // "uid": auth.user.uid
                      
                      
                      

                    });
                    
                              Navigator.pop(context);
                              // setState(() {
                              //   updateBudget(context);
                              // });
                            },
                            minWidth: 200.0,
                            height: 10.0,
                            child: Text(
                              'ADD',
                            ),
                          ),
                        ),
                      ),
                    ]
                ),
              )

          );
        });
  }


  void popup(BuildContext context){
    var alertDialog = AlertDialog(
      title: Center(child: Text("Transaction added successfully!")),
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
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xfaf16e7e),
          bottom:TabBar(
            tabs:[
               Tab(icon: Icon(Icons.account_balance_wallet)),
              Tab(icon: Icon(Icons.calendar_today_rounded, )),
              Tab(icon: Icon(Icons.history)),
              // Tab(icon: Icon(Icons.add_circle_outline)),
              // Tab(icon: Icon(Icons.receipt_outlined),)
            ]
          ),
        ),

        
        body:

        TabBarView(
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.355, 0.694, 0.864, 1.0],
                            colors: <Color> [
                              const Color(0xff3d4a62),
                              const Color(0xff695369),
                              const Color(0xffa86073),
                              const Color(0xffd16879),
                              const Color(0xfaf16e7e)
                            ],
                            )
                    ),
                    height: 200,
                    width: 400,
                    child: Row(
                      children:  <Widget>[

                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('YOUR CURRENT BALANCE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),

                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text('$_balance',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),

                              ),
                              SizedBox(
                                height: 2.0,
                              ),
                              Text('Tap here to set a monthly budget and \n manage your expenses efficiently.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
                                ),

                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(18.0,10.0,8.0,80.0),
                              child: IconButton(
                                icon: Icon(Icons.category,
                                size: 100.0,
                                ),
                                onPressed: (){
                                  print("icon pressed....");
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Image.asset('images/undraw_pink.png',
                      height: 200.0,
                    width: 200.0,
                  ),
                ),

                FloatingActionButton(onPressed:(){
                  setState(() {
                    updateBudget(context);
                  });
                },
                  child: Icon(Icons.add),
                  backgroundColor: Colors.redAccent,
                )
                
              ]
            ),






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
                    Center(child: Text('Selected date is $_selectedDate.format(context)',
                        style: TextStyle(color: Colors.white))),
                    SizedBox(height: 5),

                  ],
                ),


                RaisedButton(onPressed: (){
                  popup(context);
                  addTranscation(context);
                },
                    color: Colors.redAccent[100],
                    elevation: 5,
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'SUBMIT'
                    ))
              ],
            ),




          



              Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: _selecteddateList.length,
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
                                  "TITLE:  ${_transactionTitleList[index]}" "\n" "AMT:   ${_transctionAmtList[index]}" "\n" "ON:     ${_selecteddateList[index]}" ,
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