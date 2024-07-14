import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OTPScreenPage extends StatefulWidget {
  const OTPScreenPage({super.key});

  @override
  State<OTPScreenPage> createState() => _OTPScreenPageState();
}

class _OTPScreenPageState extends State<OTPScreenPage> {
  late FocusNode pin2;
  late FocusNode pin3;
  late FocusNode pin4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pin2 = FocusNode();
    pin3 = FocusNode();
    pin4 = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pin2.dispose();
    pin3.dispose();
    pin4.dispose();
  }

  void otpfield(String value, FocusNode focusNode){
    if(value.length == 1){
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('OTP Verification', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                children: [
                  Text('OTP Verification', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text('We sent your code to +91 635 254 ****',),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('This code will expired in '),
                      TweenAnimationBuilder(tween: Tween(begin: 30.0, end: 0), duration: Duration(seconds: 30),
                          builder: ((context, value, child) => Text('00.${value.toInt()}', style: TextStyle(color: Colors.red),)))
                    ],
                  ),

                  SizedBox(height: 100,),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                        Container(
                          height: 70,
                          width: 62,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.brown,),
                          ),
                          child: TextFormField(
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 26),
                            onChanged: (value){
                              otpfield(value, pin2);
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 62,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.brown,)
                          ),
                          child: TextFormField(
                            focusNode: pin2,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 26),
                            onChanged: (value){
                              otpfield(value, pin3);
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 62,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.brown,)
                          ),
                          child: TextFormField(
                            focusNode: pin3,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 26),
                            onChanged: (value){
                              otpfield(value, pin4);
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 62,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.brown,)
                          ),
                          child: TextFormField(
                            focusNode: pin4,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 26),
                            onChanged: (value){
                              pin4.unfocus();
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 120,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        height: 64,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text('Continue', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),

                  SizedBox(height: 40,),
                  Text('Resend OTP Code', style: TextStyle(decoration: TextDecoration.underline,),),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
