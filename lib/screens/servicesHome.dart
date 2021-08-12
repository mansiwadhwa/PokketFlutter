import 'package:flutter/material.dart';
import 'package:pokket_final/screens/serviceBooking.dart';

class ChooseService extends StatefulWidget {
  @override
  _ChooseServiceState createState() => _ChooseServiceState();
}

class _ChooseServiceState extends State<ChooseService> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xffe16671),
        centerTitle: true,
        title: Text('SERVICES'),
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //
              Container(
                width: 235.0,
                height:100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200.0),
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
                      MaterialPageRoute(builder: (context) => BookService(serviceType: "electritian",)),   //Navigation to addTransaction screen
                    );
                  },
                  color: Colors.grey[300],
                  textColor: Colors.black,
                  splashColor: Colors.blue,
                  elevation: 10.0,
                  padding: EdgeInsets.symmetric(vertical:10.0,horizontal: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                      Icons.electrical_services,
                    size: 40.0,
                  ),
                     SizedBox(
                       height: 10,
                     ),
                     Center(
                      child: Text(
                        'Electrician',
                        style: TextStyle(
                          fontFamily: 'Noto Sans',
                          fontSize: 15,
                          color: const Color(0xff3c3c3c),
                        ),
                      ),
                    ),
                  ],
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                width: 235.0,
                height:100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200.0),
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
                      MaterialPageRoute(builder: (context) => BookService()),   //Navigation to addTransaction screen
                    );
                  },
                  color: Colors.grey[300],
                  textColor: Colors.black,
                  splashColor: Colors.blue,
                  elevation: 10.0,
                  padding: EdgeInsets.symmetric(vertical:10.0,horizontal: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.car_repair,
                        size: 40.0,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          'Mechanic',
                          style: TextStyle(
                            fontFamily: 'Noto Sans',
                            fontSize: 15,
                            color: const Color(0xff3c3c3c),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                width: 235.0,
                height:100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200.0),
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
                      MaterialPageRoute(builder: (context) => BookService()),   //Navigation to addTransaction screen
                    );
                  },
                  color: Colors.grey[300],
                  textColor: Colors.black,
                  splashColor: Colors.blue,
                  elevation: 10.0,
                  padding: EdgeInsets.symmetric(vertical:10.0,horizontal: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.plumbing,
                        size: 40.0,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          'Plumber',
                          style: TextStyle(
                            fontFamily: 'Noto Sans',
                            fontSize: 15,
                            color: const Color(0xff3c3c3c),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                width: 235.0,
                height:100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200.0),
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
                      MaterialPageRoute(builder: (context) => BookService()),   //Navigation to addTransaction screen
                    );
                  },
                  color: Colors.grey[300],
                  textColor: Colors.black,
                  splashColor: Colors.blue,
                  elevation: 10.0,
                  padding: EdgeInsets.symmetric(vertical:10.0,horizontal: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.carpenter,
                        size: 40.0,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "Carpenter",
                          style: TextStyle(
                            fontFamily: 'Noto Sans',
                            fontSize: 15,
                            color: const Color(0xff3c3c3c),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )
        ),
      ),
    );
  }
}
