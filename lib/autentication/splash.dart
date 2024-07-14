import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:estate/Navigator.dart';
import 'package:estate/autentication/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../api_data/all_api.dart';
import '../api_data/get_api_data.dart';
import '../main.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  int? user_id;

  @override
  void initState() {


    super.initState();
    user_id = hiveBox.get('user_id');
    print('user_id----------$user_id');
    user_id == null
        ? Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Login()));
    })
        : Future(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationPage(index: 0),));
    });


  }

  //late Color mycolor;
  @override
  Widget build(BuildContext context) {
    //mycolor = Theme.of(context).primaryColor;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.brown,
            image: DecorationImage(
                image: const AssetImage('assets/images/Bungalow.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.brown.withOpacity(0.1), BlendMode.dstIn))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Image(image: AssetImage('assets/images/logo.png')),
            ),
            //Icon(Icons.home_work, color: Colors.white, size: 300,),
            Text(
              'REAL ESTATE',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo.withOpacity(0.9)),
            )
          ],
        ),
      ),
    );
  }
  }
