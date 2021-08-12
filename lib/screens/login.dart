import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pokket_final/screens/register.dart';
import 'package:pokket_final/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  String _email, _password ; // variables declared
  TextEditingController _emailController= TextEditingController();
  TextEditingController _passwordController= TextEditingController();
  // final GlobalKey<FormState>_formKey = GlobalKey<FormState>();  //check why this line
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,     //change
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              child: CircleAvatar(
                child: Icon(
                    Icons.account_circle,
                  size: 160.0,
                ),
                radius: 80,
                // backgroundImage: AssetImage('images/user(1).png'),
              ),
              elevation: 18.0,
              shape: CircleBorder(),
              clipBehavior: Clip.antiAlias,
            ),


              // height: 200.0,
              //  Card(
              //    elevation: 10.0,
              //    shape: CircleBorder(
              //      Radius: BorderRadius.circular(35.0),
              //    ),
              //   child: Icon(
              //       Icons.account_circle,
              //       size: 170.0,
              //       color: Colors.black,
              //
              //     ),
              // ),


          //change


            SizedBox(
              height: 48.0,
            ),
            Container(
              child: TextField(
                // validator: (input){
                //   if(input.isEmpty){
                //     return 'Enter your email';
                //   }
                // },
                // onSaved:(input) => _email = input ,
                controller: _emailController,
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Enter your email',
                  hintStyle: TextStyle( color: Colors.black26),
                  focusColor: Colors.black,
                  //fillColor: Colors.black26,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(
                        // color: Colors.lightBlueAccent,
                        // width: 1.0,
                        style: BorderStyle.none
                    ),

                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Color(0xffe16671), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1.0,
                    blurRadius: 50,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 28.0,
            ),
            Container(
              // elevation: 25,
              // shadowColor: Colors.lightBlueAccent,
              child: TextField(
                // validator: (input){
                //   if(input.length<6){
                //     return 'Your Password needs to be aleast 6 characters';
                //   }
                // },
                obscureText: true,
                // onSaved:(input) => _password = input ,
                controller: _passwordController,
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  //Do something with the user input.
                },


                decoration: InputDecoration(
                  hintText: 'Enter your password.',
                  hintStyle: TextStyle( color: Colors.black26),
                  fillColor: Colors.white,
                  filled: true,
                  // errorText: _validate ? 'Value Can\'t Be Empty' : null,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),

                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(
                      // color: Colors.lightBlueAccent,
                      //   width: 1.0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),

                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Color(0xffe16671), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),

              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1.0,
                    blurRadius: 50,
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 14.0,
            // ),
            // new Checkbox(
            //     value: checkBoxValue,
            //     activeColor: Colors.green,
            //     onChanged:(bool newValue){
            //       setState(() {
            //         checkBoxValue = newValue;
            //       });
            //       Text('Remember me');
            //     }),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Color(0xffe16671),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: (){
                    

                    signIn();
                    print(_emailController.text);
                    print(_passwordController.text);
                    

                  },
                  //() {
                  //   // Navigator.push(
                  //   //   context,
                  //   //   MaterialPageRoute(builder: (context) => HomeScreen()),
                  //   // ); //Go to login screen.
                  //   //Implement login functionality.
                  // },
                  minWidth: 200.0,
                  height: 50.0,
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize : 18.0
                  ),
                ),
              ),
            ),
            ),
            Text.rich(TextSpan(
              text: 'CREATE NEW ACCOUNT',
              style: TextStyle(
                color: const Color(0xff268cd0),
                fontWeight: FontWeight.w600,

              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationScreen()),
                  );
                },
            ),)
          ],
        ),
      ),
    );
  }
    Future<void> signIn() async {
      // final formState = _formKey.currentState;
      // if( formState.validate()){
      //   formState.save();
        try{
         await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text ,password:_passwordController.text).then((user){print(user.user.email);     });
         
        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
        }
        on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  };
        // catch (e){
          
        //   print(e.message);
        }

    

      

    }
  }


