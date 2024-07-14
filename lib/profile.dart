import 'dart:convert';
// import 'dart:html';
import 'dart:io';
// import 'dart:html';

import 'package:estate/Navigator.dart';
import 'package:estate/api_data/all_api.dart';
import 'package:estate/api_data/get_api_data.dart';
import 'package:estate/main.dart';
import 'package:estate/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class RealEstateResponse {
  RealEstateApp realEstateApp;
  int statusCode;
  String message;
  int success;

  RealEstateResponse({
    required this.realEstateApp,
    required this.statusCode,
    required this.message,
    required this.success,
  });

  factory RealEstateResponse.fromJson(Map<String, dynamic> json) {
    return RealEstateResponse(
      realEstateApp: RealEstateApp.fromJson(json['REAL_ESTATE_APP']),
      statusCode: json['status_code'],
      message: json['msg'],
      success: json['success'],
    );
  }
}

class RealEstateApp {
  String userImage;

  RealEstateApp({
    required this.userImage,
  });

  factory RealEstateApp.fromJson(Map<String, dynamic> json) {
    return RealEstateApp(
      userImage: json['user_image'],
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String? base64string;
  File? profileimage;
  NetworkImage imageprofile = NetworkImage(hiveBox.get('user_image'));
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController error = TextEditingController(text: 'Text');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfileData();
  }

  bool _obsecuretext = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(height: 270,),
                  Container(
                            height: 58,
                            margin: EdgeInsets.only(left: 16, right: 16),
                            decoration: BoxDecoration(
                              color: Colors.brown.shade50,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [BoxShadow(color: Colors.brown, blurRadius: 1.0)],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: profileDetail.isEmpty? error: name,
                                keyboardType: TextInputType.name,
                                style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),

                  SizedBox(height: 12,),
                  Container(
                    height: 58,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                      color: Colors.brown.shade50,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.brown, blurRadius: 1.0)],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: profileDetail.isEmpty? error: email,
                        keyboardType: TextInputType.name,
                        style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 12,),
                  Container(
                    height: 58,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                      color: Colors.brown.shade50,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.brown, blurRadius: 1.0)],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: password,
                        keyboardType: TextInputType.name,
                        style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 16, fontWeight: FontWeight.bold),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15,),
                  Container(
                    height: 58,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                      color: Colors.brown.shade50,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.brown, blurRadius: 1.0)],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: profileDetail.isEmpty? error: phone,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),


                  SizedBox(height: 222,),
                  SizedBox(
                    height: 56,
                    width: 380,
                    child: ElevatedButton(onPressed: () {
                      UpdateProfileData();
                      Fluttertoast.showToast(
                          msg: "Successfully update",
                          backgroundColor: Colors.grey,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      setState(() {

                      });

                    }, child: Text('Update', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.brown),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                  )
                ],
              ),
            ),

            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
              ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationPage(index: 0),));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.arrow_back_ios_rounded, size: 30, color: Colors.brown,),
                              ),
                            ),
                          ),

                          SizedBox(width: 20,),
                          Text('Edit Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                        ],
                      ),

                      SizedBox(height: 30,),
                      Row(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: profileimage==null?
                                profileDetail['user_image']==null?
                                Center(child: CircularProgressIndicator()):
                                Image.network(profileDetail['user_image'], height: 100, width: 100, fit: BoxFit.cover,):
                                Image.file(profileimage!, height: 100, width: 100, fit: BoxFit.cover,),
                              ),

                              Positioned(
                                right: 0,
                                bottom: 5,
                                child: GestureDetector(
                                  onTap: () {
                                    // UpdateProfileData();
                                    imagepicker();
                                    setState(() {

                                    });
                                  },
                                  child: Container(
                                    // height: 30,
                                    // width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Icon(Icons.cloud_upload_outlined, color: Colors.brown, size: 18,),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(profileDetail.isEmpty? error.text:name.text, style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),),

                                  SizedBox(height: 5,),
                                  Container(decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(profileDetail.isEmpty? error.text:email.text, style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),),
                                      )),
                                ],
                              ),
                        ],
                      ),
                    ],
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }

  getProfileData() async {
    String ba64 = base64.encode(
        "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"user_id\":\"${hiveBox.get('user_id')}\"}"
            .codeUnits);

    final response = await http.post(
        Uri.parse(profiledataUrl),
        body: {
          'data': ba64,
        });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {

      });
      if (data['status_code'] == 200) {
        profileDetail = data['REAL_ESTATE_APP'];
        name.text = profileDetail['name'];
        email.text = profileDetail['email'];
        phone.text = profileDetail['phone'];
        setState(() {

        });
      }
      else {
        print('Invalid Data');
      }

    } else {
      print('Invalid Data');
    }
  }

  UpdateProfileData() async {
    String ba64 = base64.encode("{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"user_id\":\"${hiveBox.get('user_id')}\",\"name\":\"${name.text.trim()}\",\"email\":\"${email.text.trim()}\",\"password\":\"\",\"phone\":\"${phone.text.trim()}\"}".codeUnits);

    var request = http.MultipartRequest('POST', Uri.parse(imageupdateUrl));
    request.fields['data'] = ba64;

    if(profileimage!=null){
      request.files.add(await http.MultipartFile.fromPath('user_image', profileimage!.path));
    }

    final response = await request.send();
    final responseString = await response.stream.bytesToString();

    if(response.statusCode == 200){
      Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationPage(index: 0),));
      setState(() {

      });
    }
  }

  void imagepicker() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(file != null){
      setState(() {
        profileimage = File(file.path);
      });
    }else{
      print('did not select image');
    }
  }
  }



