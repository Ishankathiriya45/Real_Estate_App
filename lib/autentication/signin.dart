import 'dart:convert';
// import 'dart:html';

import 'package:estate/autentication/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../Navigator.dart';


class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {

  String? singUpBase64;
  bool isName(String input) => RegExp(r'(?=.*?[A-Z])').hasMatch(input);
  bool isEmail(String input) => RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[@#$\*~]).{6,}$').hasMatch(input);
  bool isPass(String input) => RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[@#$\*~]).{6,}$').hasMatch(input);
  final _formkeys = GlobalKey<FormState>();
  TextEditingController name =TextEditingController();
  TextEditingController email =TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController number =TextEditingController();
  bool check = false;

  SingUpBase64(String name,String email,String password,int number){
    String make = "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"name\":\"$name\",\"email\":\"$email\",\"password\":\"$password\",\"phone\":\"$number\"}";
    String ba64 = base64.encode(make.codeUnits);
    singUpBase64 = ba64;
    SingUpApi();
  }
  SingUpApi() async {
    try {
      final response = await http.post(
          Uri.parse('https://unseens.com/Ishan_Web/php_web_services/public/api/v1/signup'),
          body: {
            'data': singUpBase64,
          });
      print(response.statusCode);
      if (response.statusCode == 200) {
        // Successful POST request, handle the response here
        final responseData = jsonDecode(response.body);
        final data = jsonDecode(response.body);
        print(data);
        if (data['success'] == 1) {
          // singUp.put('user_id', data['user_id'])
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Login(),
            ),
          );
        }
        else{
          Navigator.pop(context);
          final snackBar = SnackBar(
            content: Text(data['msg']),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        print('okkkkkk');
      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to post data');
      }
    } catch (e) {
      setState(() {
        print(e);
      });
    }
  }

  bool _obscuretext = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formkeys,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, right: 20, bottom: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  const Text('Sign Up', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  const Text('Let`s Sign in. Apply to Property!', style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w500),),

                  const SizedBox(height: 70,),
                  Container(
                    height: 62,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(-1, 2),

                        ),
                        ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: name,
                        decoration: const InputDecoration(
                            hintText: 'Name',
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                            border: InputBorder.none
                        ),
                        validator: (value){
                          if(value!.isEmpty || !isName(value)){
                            return 'Please Enter Name';
                          }else{
                            return null;
                          }
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 20,),
                  Container(
                    height: 62,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(-1, 2),

                        ),
                        ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: email,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                            border: InputBorder.none
                        ),
                        validator: (value){
                          if(value!.isEmpty || !isEmail(value) || !value.contains(".com")){
                            return 'Please Enter Email';
                          }else{
                            return null;
                          }
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 20,),
                  Container(
                    height: 62,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(-1, 2),

                        ),
                        ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: password,
                        obscureText: _obscuretext,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(onTap: () {
                            setState(() {
                              _obscuretext =!_obscuretext;
                            });
                          },
                            child: Icon(_obscuretext ? Icons.visibility : Icons.visibility_off),
                          ),
                            hintText: 'Password',
                            hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                            border: InputBorder.none
                        ),
                        validator: (value){
                          if(value!.isEmpty || !isPass(value)){
                            return 'Please Enter Password';
                          }else{
                            return null;
                          }
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 20,),
                  Container(
                    height: 62,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(-1, 2),

                        ),
                        ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: number,
                        decoration: const InputDecoration(
                            hintText: 'Phone',
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                            border: InputBorder.none
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please Enter Phone Number';
                          }else{
                            return null;
                          }
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 40,),
                  InkWell(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                      if(_formkeys.currentState!.validate() && check==true){
                        SingUpBase64(name.text.trim(), email.text.trim(), password.text.trim(), int.parse(number.text.trim()));
                      }else{
                        Fluttertoast.showToast(
                            msg: "Accept Privacy Policy",
                            toastLength: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.grey,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                      // SingUpBase64(name.text.trim(), email.text.trim(), password.text.trim(), int.parse(number.text.trim()));
                    },
                    child: Container(
                      height: 62,
                      width: 400,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.brown,
                          boxShadow: [BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(-1, 2),
                          ),]
                      ),
                      child: const Text('Sign up', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                    ),
                  ),

                  const SizedBox(height: 30,),
                  Row(
                    children: [
                      // GestureDetector(
                      //   onTap: () {
                      //     check=true;
                      //     setState(() {
                      //
                      //     });
                      //   },
                      //     child: check==true? Icon(Icons.radio_button_on, color: Colors.brown,):Icon(Icons.radio_button_off, color: Colors.brown,)),
                      Checkbox(value: check,
                      checkColor: Colors.white,
                      activeColor: Colors.brown,
                      onChanged: (bool? val){
                        setState(() {
                          check = val!;
                        });
                      }),
                      const Text('By Signing in you accept', style: TextStyle(fontSize: 15, color: Colors.black54, fontWeight: FontWeight.w500),),
                      TextButton(onPressed: () {},
                        child: const Text('Privacy Policy', style: TextStyle(fontSize: 16, color: Colors.brown, fontWeight: FontWeight.w500),),)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black54),),
                      TextButton(onPressed: () {
                        Navigator.pop(context);
                      },
                        child: const Text('Login', style: TextStyle(fontSize: 17, color: Colors.brown, fontWeight: FontWeight.w500),),)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
