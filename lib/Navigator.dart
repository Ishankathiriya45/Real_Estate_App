import 'dart:io';

import 'package:estate/Home.dart';
import 'package:estate/api_data/all_api.dart';
import 'package:estate/category.dart';
import 'package:estate/latest_property.dart';
import 'package:estate/property.dart';
import 'package:estate/property_add.dart';
import 'package:estate/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'main.dart';

class NavigationPage extends StatefulWidget {
  int index;
  NavigationPage({required this.index, super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = widget.index;
  }

  List Nav = [
    Home(),
    const LatestPage(),
    CategoryPage(),
    const PropertyPage(),
    const SettingPage(),
  ];
  final navigatorBox = Hive.box('EstateBox');
  int index = 0;
  update(int value) {
    index = value;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exit(0);
      },
      child: Scaffold(
        body: Center(child: Nav.elementAt(index)),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home', backgroundColor: Colors.white),
          BottomNavigationBarItem(icon: Icon(Icons.watch_later_outlined), label: 'Latest', backgroundColor: Colors.white),
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: 'Category', backgroundColor: Colors.white),
          BottomNavigationBarItem(icon: Icon(Icons.apartment_outlined), label: 'My Property', backgroundColor: Colors.white),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting', backgroundColor: Colors.white)
        ],
          onTap: update,
          selectedLabelStyle: const TextStyle(fontSize: 16),
          currentIndex: index,
          iconSize: 30,
          selectedItemColor: Colors.brown,
          unselectedItemColor: Colors.grey,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PropertyAddPage(),));
          },
          child: const Icon(Icons.add_home_work_outlined, color: Colors.white,),
          backgroundColor: Colors.brown,
        ),
      ),
    );
  }
}
