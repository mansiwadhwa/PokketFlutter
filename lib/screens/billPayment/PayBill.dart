import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  double _paymentAmt;
  String _payee;
  String _paymentDesc;
  int _cardNo;

  void _athentication(context){
    showModalBottomSheet(context: context, builder:(BuildContext bc){
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
                            'Enter UserName and Password ',
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
                        // _transactiontitle = value;
                      },
                      decoration:InputDecoration(
                        hintText: "Username",
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
                      // _transactionamt = value as double;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
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
                          Navigator.pop(context);
                          setState(() {
                            //updateBudget(_balance = _balance - _transactionamt);
                            _cardCvv(context);
                          });
                        },
                        minWidth: 200.0,
                        height: 10.0,
                        child: Text(
                          'Submit',
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

  void _cardCvv(context){
    showModalBottomSheet(context: context, builder:(BuildContext bc){
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
                            'Enter CVV and Card Details ',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20.0,
                            ))),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  //Cvv
                  TextField(
                      onChanged: (value){
                        //Do something with the user input.
                        // _transactiontitle = value;
                      },
                      decoration:InputDecoration(
                        hintText: "CVV",
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
                  //card valid from
                  TextField(
                    onChanged:(value){
                      //Do something with the user input.
                      // _transactionamt = value as double;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Card Valid From',
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
                  SizedBox(
                    height:8.0,
                  ),
                  //Card Valid to
                  TextField(
                    onChanged:(value){
                      //Do something with the user input.
                      // _transactionamt = value as double;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Card Valid To',
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
                          Navigator.pop(context);
                          setState(() {
                            //updateBudget(_balance = _balance - _transactionamt);
                            popup(context);
                          });
                        },
                        minWidth: 200.0,
                        height: 10.0,
                        child: Text(
                          'Submit',
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
      title: Center(child: Text("Transaction successful !")),
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
        backgroundColor:  Color(0xffe16671),
        centerTitle: true,
        toolbarHeight: 60.2,
        title: Text('PAY'),
        elevation: 10.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      //Amount
                      TextField(
                          onChanged: (value) {
                            //Do something with the user input.
                            _paymentAmt = value as double;
                          },
                          decoration:InputDecoration(
                            hintText: "Enter Amount",
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
                        height: 10,
                      ),
                      //Pay To
                      TextField(
                          onChanged: (value) {
                            //Do something with the user input.
                            _payee = value;
                          },
                          decoration:InputDecoration(
                            hintText: "Pay To:",
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
                        height: 10,
                      ),
                      //Description
                      TextField(
                          onChanged: (value) {
                            //Do something with the user input.
                            _paymentDesc = value ;
                          },
                          decoration:InputDecoration(
                            hintText: "Add Description",
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
                        height: 10,
                      ),
                      //Card No.
                      TextField(
                          onChanged: (value) {
                            //Do something with the user input.
                            _cardNo = value as int ;
                          },
                          decoration:InputDecoration(
                            hintText: "Enter 16 Digit Card No.",
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
                      RaisedButton(
                        onPressed: (){
                          _athentication(context);
                        },
                        color: Colors.teal,
                        child: Text(
                          "SEND",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      )
                      // showModalBottomSheet(
                      //     context: Context,
                      //     builder: null)



                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}





