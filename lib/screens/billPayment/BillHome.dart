import 'package:flutter/material.dart';
import 'package:pokket_final/screens/billPayment/PayBill.dart';

class BillHome extends StatefulWidget {
  @override
  _BillHomeState createState() => _BillHomeState();
}

class _BillHomeState extends State<BillHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xffe16671),
          centerTitle: true,
          toolbarHeight: 60.2,
          title: Text('BILL PAYMENT'),
          elevation: 10.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            ReusableCard(
                              symbol: Icons.waves,
                              name: "Water",
                            ),
                            SizedBox(width: 30,),
                            ReusableCard(
                              symbol: Icons.electrical_services,
                              name: "Electricity",
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            ReusableCard(
                                symbol: Icons.local_gas_station,
                                name: "Fuel"
                            ),
                            SizedBox(width: 30,),
                            ReusableCard(
                                symbol: Icons.tv_outlined,
                                name: "TV"
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            ReusableCard(
                                symbol: Icons.phone_android_rounded,
                                name: "Phone"
                            ),
                            SizedBox(width: 30,),
                            ReusableCard(
                                symbol: Icons.house_outlined,
                                name: "Rent"
                            ),
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
          ),
        )
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({this.symbol,this.name});

  final IconData symbol;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(200.0),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(200.0),
          bottomLeft: Radius.circular(200.0),
        ),
        color: const Color(0x24ededef),
        boxShadow: [
          BoxShadow(
            color: const Color(0x06000000),//shadow colour
            offset: Offset(0, 20),
            blurRadius: 6,
          ),
        ],
      ),
      child: RaisedButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Payment()),
          );
        },

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          // side: BorderSide(color: Colors.red)
        ),
        color: Colors.grey[200],
        textColor: Colors.black,
        splashColor: Colors.blue,
        elevation: 10.0,
        padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
        //Column for Icon and Text
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(symbol,
              size: 50.0,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                name,
                style:TextStyle(
                  fontSize: 15,
                  fontFamily: 'Noto Sans',
                  color: const Color(0xff3c3c3c),
                )
            )

          ],
        ),
      ),
    );
  }
}
