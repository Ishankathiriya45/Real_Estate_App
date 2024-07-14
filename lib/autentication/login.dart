import 'dart:convert';

import 'package:estate/Home.dart';
import 'package:estate/Navigator.dart';
import 'package:estate/forgot_pass.dart';
import 'package:estate/main.dart';
import 'package:estate/autentication/signin.dart';
import 'package:estate/autentication/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();

}

//List<String> option = ['option1', 'option2'];
class LoginResponse {
  RealEstateApp realEstateAppgsf;
  int statusCode;
  String message;
  int success;

  LoginResponse({
    required this.realEstateAppgsf,
    required this.statusCode,
    required this.message,
    required this.success,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      realEstateAppgsf: RealEstateApp.fromJson(json['REAL_ESTATE_APP']),
      statusCode: json['status_code'],
      message: json['msg'],
      success: json['success'],
    );
  }
}


class RealEstateApp {
  int user_id;
  String name;
  String email;
  String phone;
  String userImage;

  RealEstateApp({
    required this.user_id,
    required this.name,
    required this.email,
    required this.phone,
    required this.userImage,
  });

  factory RealEstateApp.fromJson(Map<String, dynamic> json) {
    return RealEstateApp(
      user_id: json['user_id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      userImage: json['user_image'],
    );
  }
}


class _LoginState extends State<Login> {

  final _formkey = GlobalKey<FormState>();
  bool isError = false;
  bool _obsecurText = true;
  bool check1 = false;
  bool check2 = false;
  bool checkbox = false;
  bool checkbox2 = false;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController _controller = TextEditingController();

  @override
  void initState()
  {

    getbytedate();
    super.initState();
  }

  // String currentoption = option[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, right: 20, bottom: 20, left: 20),
              child: Column(
                children: [
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Welcome Back!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          const Text(
                            'Let`s Log in. Apply to Property!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavigationPage(index: 0),
                              ));
                        },
                        child: Container(
                          height: 50,
                          width: 90,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.brown),
                          child: const Text(
                            'Skip',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 62,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(-1, 2),
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: email,
                        decoration: const InputDecoration(
                          hintText: 'Enter Email',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Email';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 62,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(-1, 2),
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          obscureText: _obsecurText,
                          controller: password,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obsecurText = !_obsecurText;
                                  });
                                },
                                child: Icon(_obsecurText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          }),
                    ),
                  ),

                  //SizedBox(height: 5,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(value: checkbox2,
                              checkColor: Colors.white,
                              activeColor: Colors.brown,
                              onChanged: (bool? val){
                                setState(() {
                                  checkbox2 = val!;
                                });
                              }),
                          const Text(
                            'Remember me',
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPage(),));
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () async {
                      if (_formkey.currentState!.validate() && checkbox == true) {
                        showDialog(context: context, builder: (context) {
                          return Material(
                            borderOnForeground: false,
                            color: Colors.transparent,
                            child: Center
                              (
                                child: CircularProgressIndicator()),
                          );
                        });

                        //SpinKitChasingDots(color: Colors.green, size: 200, duration: Duration(milliseconds: 3000),);
                        String make =
                            "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"email\":\"${email.text.trim()}\",\"password\":\"${password.text.trim()}\"}";
                        String ba64 = base64.encode(make.codeUnits);
                        print(ba64);
                        _postData(ba64);
                        setState(() {});
                        email.clear();
                        password.clear();
                        FocusScope.of(context).requestFocus(new FocusNode());
                      }
                      else{
                        Fluttertoast.showToast(
                                  msg: "Accept Privacy Policy",
                                  backgroundColor: Colors.grey,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                      }
                    },
                    child: Container(
                      height: 62,
                      width: 400,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.brown,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(-1, 2),
                            ),
                          ]),
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(value: checkbox,
                              checkColor: Colors.white,
                              activeColor: Colors.brown,
                              onChanged: (bool? val){
                            setState(() {
                              checkbox = val!;
                            });
                          }),
                          const Text(
                            'By Signing in you accept',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                          //SizedBox(width: 5,),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Privacy Policy',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.brown,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      )
                    ],
                  ),


                  const SizedBox(
                    height: 25,
                  ),
                  const Text('or continue with',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500)),

                  const SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 70,
                            width: 180,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    offset: const Offset(-1, 2),
                                  ),
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/facebook.png')),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Facebook',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            height: 70,
                            width: 180,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    offset: const Offset(-1, 2),
                                  ),
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/google.png')),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Google',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Sign(),
                              ));
                        },
                        child: const Text("Sign up",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.brown,
                                fontWeight: FontWeight.w500)),
                      ),
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

getbytedate()
{
  //login
 String make = "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"email\":\"tp@gmail.com\",\"password\":\"123456\"}";
 //home
  //String make = "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"name\":\"ishan\",\"email\":\"ishan3@gmail.com\",\"password\":\"123456\",\"phone\":\"9965369874\"}";
//Property Details
  //String make = "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"property_id\":\"42\",\"user_id\":\"5\"}";
//Latest property
  //String make = "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"type_id\":\"1\",\"user_id\":\"5\"}";
  print(make);
  String ba64 = base64.encode(make.codeUnits);
  print("data in base64----------->>>>>"+ba64);
}

  Future<void> _postData(String b) async {
    try {
      final response = await http.post(
          Uri.parse('https://unseens.com/Ishan_Web/php_web_services/public/api/v1/login'),
          body: {
            'data': b,
          });
      print(response.statusCode);
      if (response.statusCode == 200) {
        // Successful POST request, handle the response here
        final responseData = jsonDecode(response.body);

        Map<String, dynamic> parsedJson = jsonDecode(response.body);

        int user_id = parsedJson["REAL_ESTATE_APP"]["user_id"];

        int statusCode = parsedJson["status_code"];
        String message = parsedJson["msg"];
        int success = parsedJson["success"];

        print("User Image: $user_id");
        print("Status Code: $statusCode");
        print("Message: $message");
        print("Success: $success");

        LoginResponse loginResponse = LoginResponse.fromJson(parsedJson);
        print("User Image11111: "+loginResponse.realEstateAppgsf.user_id.toString());
        print("User Image222222: "+loginResponse.message);
        print("User Image222222: "+loginResponse.success.toString());

        final data = jsonDecode(response.body);
        print(data);
        if (data['success'] ==1) {
          print(data['REAL_ESTATE_APP']['user_id']);
          hiveBox.put('user_id',data['REAL_ESTATE_APP']['user_id']);
          hiveBox.put('name',data['REAL_ESTATE_APP']['name']);
          hiveBox.put('email',data['REAL_ESTATE_APP']['email']);
          hiveBox.put('phone',data['REAL_ESTATE_APP']['phone']);
          hiveBox.put('user_image',data['REAL_ESTATE_APP']['user_image']);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NavigationPage(index: 0),
            ),
          );
        }
        else{
          Navigator.pop(context);
          const snackBar = SnackBar(
            content: Text('Email and Password is Invalid'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
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
}
