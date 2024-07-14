import 'dart:convert';
// import 'dart:html';
import 'dart:io';
// import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:estate/Navigator.dart';
import 'package:estate/api_data/all_api.dart';
import 'package:estate/api_data/get_api_data.dart';
import 'package:estate/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

// List profileDetail = [];

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

class CatThirdPage extends StatefulWidget {
  const CatThirdPage({super.key});

  @override
  State<CatThirdPage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<CatThirdPage> {

  String? base64string;
  File? imagepro;
  NetworkImage imageprofile = NetworkImage(hiveBox.get('user_image'));
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool _obsecuretext = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        automaticallyImplyLeading: true,
        title: Text('Edit Profile', style: TextStyle(color: Colors.white, fontSize: 20),),
      ),

      body: Center(
        child: Container(
          height: 200,
          width: 200,
          child: CachedNetworkImage(
            imageUrl: 'https://media.istockphoto.com/id/1486626509/photo/woman-use-ai-to-help-work-or-use-ai-everyday-life-at-home-ai-learning-and-artificial.webp?b=1&s=170667a&w=0&k=20&c=0hLE8QKIJR4d7kts1kCN_SJ0FYH-5BhOV1KKKY21prA=',
            fit: BoxFit.cover,
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Center(child: Icon(Icons.error, size: 30)),
          ),
        ),
      )
    );
  }
}



