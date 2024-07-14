import 'dart:convert';

import 'package:estate/autentication/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_data/all_api.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {

  final _formkey = GlobalKey<FormState>();
  bool isPhone(String input) => RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&]).{6,}$'
  ).hasMatch(input);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back)
        ),

        title: Text('Forgot Password', style: TextStyle(fontSize: 20),),
      ),
      
      body: Center(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Forgot Password?', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Text('Enter your valid email address below and we will send you email with '
                    'instructions on how to change your password', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold
                , color: Colors.grey.shade600, )),
              ),

              SizedBox(height: 40,),
              Container(
                height: 60,
                width: 360,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.brown.shade100,
                  boxShadow: [BoxShadow(blurRadius: 1, color: Colors.grey)]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter Email',
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      border: InputBorder.none
                    ),
                    validator: (value){
                      if(value!.isEmpty || !isPhone(value) || !value.contains('.com')){
                        return 'Please Enter Email';
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
              ),

              SizedBox(height: 20,),
              SizedBox(
                height: 60,
                width: 360,
                child: ElevatedButton(
                    onPressed: () {
                      if(_formkey.currentState!.validate())
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                      getPassword('email', context);
                      setState(() {

                      });
                    },
                    child: Text('Send Email', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    backgroundColor: MaterialStatePropertyAll(Colors.brown)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getPassword(String email, context) async {
    String ba64 = base64.encode("{\"package_name\":\"com.example.realestate\",\"email\":\"$email\"}".codeUnits);

    final response = await http.post(Uri.parse(forgotPasswordUrl),
      body: {
      'data': ba64
      }
    );

    print('----data---$ba64');
    print(response.statusCode);
    if(response.statusCode==200){
      final data = jsonDecode(response.body);

      if(data['status_code']==200){
        setState(() {

        });
      }
    }
  }
}
