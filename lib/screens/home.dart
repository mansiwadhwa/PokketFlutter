import 'package:flutter/material.dart';
import 'package:pokket_final/screens/billPayment/BillHome.dart';
import 'dart:ui';
import 'package:pokket_final/screens/budget.dart';
import 'package:pokket_final/screens/servicesHome.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xffe16671),
        centerTitle: true,
        title: Text('HOME'),
        elevation: 10.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0)
        ),
      ),
      backgroundColor: Colors.white,
        body:SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Bill Payment
                Container(
                  width: 235.0,
                  height: 150.0,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(200.0),
                  // ),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(80)),


                    color: const Color(0x24ededef),//container color
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x06000000),//shadow colour
                        offset: Offset(0, 10),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BillHome()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      // side: BorderSide(color: Colors.red)
                    ),
                    //Button Properties
                    color: Colors.grey[300],
                    textColor: Colors.black,
                    splashColor: Colors.blue,
                    elevation: 10.0,
                    padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                    //Column for Icon and Text
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.payment,
                          size: 50.0,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontFamily: 'Noto Sans',
                              fontSize: 15,
                              color: const Color(0xff3c3c3c),
                            ),
                            children: [
                              TextSpan(
                                text: 'B',
                              ),
                              TextSpan(
                                text: 'ill',
                              ),
                              TextSpan(
                                text: ' P',
                              ),
                              TextSpan(
                                text: 'ayment',
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),

                //Budget management
                Container(
                  width: 235.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(73.0),
                    color: const Color(0x24ededef),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x06000000),
                        offset: Offset(0, 10),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BudgetPage()),
                      ); //Go to login screen.
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      // side: BorderSide(color: Colors.red)
                    ),
                    color: Colors.grey[300],
                    textColor: Colors.black,
                    splashColor: Colors.blue,
                    elevation: 10.0,
                    padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.pie_chart,
                          size: 50.0,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontFamily: 'Noto Sans',
                              fontSize: 15,
                              color: const Color(0xff3c3c3c),
                            ),
                            children: [
                              TextSpan(
                                text: 'B',
                              ),
                              TextSpan(
                                text: 'udget Management',
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),

                      ],
                    ),

                  ),
                ),

                //Services
                Container(
                  width: 235.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(300.0),
                    border: Border.all(
                       color: const Color(0x24ededef),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x06000000),
                        offset: Offset(0, 10),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: RaisedButton(

                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChooseService()),
                      );
                    },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          // side: BorderSide(color: Colors.red)
                      ),
                    color: Colors.grey[300],
                    textColor: Colors.black,
                    splashColor: Colors.blue,
                      elevation: 10.0,
                    padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.pan_tool,
                          size: 50.0,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text.rich(  //for different text styles and inline span
                          TextSpan(
                            style: TextStyle(
                              fontFamily: 'Noto Sans',
                              fontSize: 15,
                              color: const Color(0xff3c3c3c),
                            ),
                            children: [
                              TextSpan(
                                text: 'M',
                              ),
                              TextSpan(
                                text: 'aintenance',
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),

                      ],
                    )

                  ),
                ),
              ],
            )
          ),
        )
    );
  }
}