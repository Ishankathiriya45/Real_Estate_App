// import 'dart:html';

import 'dart:convert';

import 'package:estate/advance_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'api_data/all_api.dart';
import 'api_data/get_api_data.dart';
import 'package:http/http.dart' as http;



class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {

  List verified = ['Non Verified Properties', 'Verified Properties'];

  int select = 2;
  int bed = 10;
  int bath = 10;
  int furnish = 3;
  int property = 7;
  double low = 200000;
  double high = 11000000;

  String? select_veri;
  int? select_bed;
  int? select_bath;
  String? select_furnish;
  int? select_property;
  double? select_low;
  double? select_high;

  RangeValues _currentRangeValues = const RangeValues(200000.0, 11000000.0);

  final startcontroller = TextEditingController();
  final endcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(indent: 130, endIndent: 130, thickness: 2,),
            Text('Advance Property Filter', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            Divider(indent: 30, endIndent: 30,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Recommended Filter', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          select=0;
                          select_veri='No';
                          setState(() {

                          });
                        },
                        child: Container(
                          height: 50,
                          width: 180,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: select==0? Colors.brown : Colors.brown.shade50,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text('Non Verified Properties', style: TextStyle(fontSize: 14, color: select==0? Colors.white:Colors.brown, fontWeight: FontWeight.bold),),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          select=1;
                          select_veri='Yes';
                          setState(() {

                          });
                        },
                        child: Container(
                          height: 50,
                          width: 180,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: select==1? Colors.brown : Colors.brown.shade50,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text('Verified Properties', style: TextStyle(fontSize: 14, color: select==1? Colors.white:Colors.brown, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ],
                  ),

                  Divider(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Price Range', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    ],
                  ),

              RangeSlider(
                values: _currentRangeValues,
                max: 11000000,
                divisions: 20,
                labels: RangeLabels(
                  _currentRangeValues.start.toInt().toString(),
                  _currentRangeValues.end.toInt().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                    select_low = values.start;
                    select_high = values.end;
                  });
                },
                activeColor: Colors.brown,
                inactiveColor: Colors.brown.shade50,
              ),

                  Divider(),

                  Row(
                    children: [
                      Text('Bedrooms', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          bed=0;
                          select_bed=1;
                          setState(() {

                          });
                        },
                        child: Container(
                          height: 50,
                          width: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: bed==0? Colors.brown: Colors.brown.shade50,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text('1', style: TextStyle(fontSize: 18, color: bed==0? Colors.white: Colors.brown, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          bed=1;
                          select_bed=2;
                          setState(() {

                          });
                        },
                        child: Container(
                          height: 50,
                          width: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: bed==1? Colors.brown: Colors.brown.shade50,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text('2', style: TextStyle(fontSize: 18, color: bed==1? Colors.white: Colors.brown, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          bed=2;
                          select_bed=3;
                          setState(() {

                          });
                        },
                        child: Container(
                          height: 50,
                          width: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: bed==2? Colors.brown: Colors.brown.shade50,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text('3', style: TextStyle(fontSize: 18, color: bed==2? Colors.white: Colors.brown, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          bed=3;
                          select_bed=4;
                          setState(() {

                          });
                        },
                        child: Container(
                          height: 50,
                          width: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: bed==3? Colors.brown: Colors.brown.shade50,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text('4', style: TextStyle(fontSize: 18, color: bed==3? Colors.white: Colors.brown, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),

                  Divider(),

                  Row(
                    children: [
                      Text('Bathrooms', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          bath=0;
                          select_bath=0;
                          setState(() {

                          });
                        },
                        child: Container(
                          height: 50,
                          width: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: bath==0? Colors.brown: Colors.brown.shade50,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text('Any', style: TextStyle(fontSize: 18, color: bath==0? Colors.white: Colors.brown, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          bath=1;
                          select_bath=1;
                          setState(() {

                          });
                        },
                        child: Container(
                          height: 50,
                          width: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: bath==1? Colors.brown: Colors.brown.shade50,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text('1', style: TextStyle(fontSize: 18, color: bath==1? Colors.white: Colors.brown, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          bath=2;
                          select_bath=2;
                          setState(() {

                          });
                        },
                        child: Container(
                          height: 50,
                          width: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: bath==2? Colors.brown: Colors.brown.shade50,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text('2', style: TextStyle(fontSize: 18, color: bath==2? Colors.white: Colors.brown, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          bath=3;
                          select_bath=3;
                          setState(() {

                          });
                        },
                        child: Container(
                          height: 50,
                          width: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: bath==3? Colors.brown: Colors.brown.shade50,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text('3', style: TextStyle(fontSize: 18, color: bath==3? Colors.white: Colors.brown, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),

                  Divider(),

                  Row(
                    children: [
                      Text('Furnishing', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          furnish=0;
                          select_furnish='Furnished';
                          setState(() {

                          });
                        },
                        child: Container(
                          // height: 50,
                          // width: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: furnish==0? Colors.brown: Colors.brown.shade50,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text('Furnishing', style: TextStyle(fontSize: 14, color: furnish==0? Colors.white: Colors.brown, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          furnish=1;
                          select_furnish='Semi-Furnished';
                          setState(() {

                          });
                        },
                        child: Container(
                          // height: 50,
                          // width: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: furnish==1? Colors.brown: Colors.brown.shade50,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text('Semi-Furnished', style: TextStyle(fontSize: 14, color: furnish==1? Colors.white: Colors.brown, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          furnish=2;
                          select_furnish='Unfurnished';
                          setState(() {

                          });
                        },
                        child: Container(
                          // height: 50,
                          // width: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: furnish==2? Colors.brown: Colors.brown.shade50,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text('Unfurnished', style: TextStyle(fontSize: 14, color: furnish==2? Colors.white: Colors.brown, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Divider(),

                  Row(
                    children: [
                      Text('Property Type', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          property=0;
                          select_property=1;
                          setState(() {

                          });
                        },
                        child: Container(
                          // height: 50,
                          // width: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: property==0? Colors.brown: Colors.brown.shade50,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text('Apartment', style: TextStyle(fontSize: 14, color: property==0? Colors.white: Colors.brown, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          property=1;
                          select_property=2;
                          setState(() {

                          });
                        },
                        child: Container(
                          // height: 50,
                          // width: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: property==1? Colors.brown: Colors.brown.shade50,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text('Commercial', style: TextStyle(fontSize: 14, color: property==1? Colors.white: Colors.brown, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          property=2;
                          select_property=3;
                          setState(() {

                          });
                        },
                        child: Container(
                          // height: 50,
                          // width: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: property==2? Colors.brown: Colors.brown.shade50,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text('House', style: TextStyle(fontSize: 14, color: property==2? Colors.white: Colors.brown, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          property=3;
                          select_property=4;
                          setState(() {

                          });
                        },
                        child: Container(
                          // height: 50,
                          // width: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: property==3? Colors.brown: Colors.brown.shade50,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text('Industrial', style: TextStyle(fontSize: 14, color: property==3? Colors.white: Colors.brown, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          property=4;
                          select_property=5;
                          setState(() {

                          });
                        },
                        child: Container(
                          // height: 50,
                          // width: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: property==4? Colors.brown: Colors.brown.shade50,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text('Land', style: TextStyle(fontSize: 14, color: property==4? Colors.white: Colors.brown, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          property=5;
                          select_property=6;
                          setState(() {

                          });
                        },
                        child: Container(
                          // height: 50,
                          // width: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: property==5? Colors.brown: Colors.brown.shade50,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text('Office', style: TextStyle(fontSize: 14, color: property==5? Colors.white: Colors.brown, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          property=6;
                          select_property=7;
                          setState(() {

                          });
                        },
                        child: Container(
                          // height: 50,
                          // width: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: property==6? Colors.brown: Colors.brown.shade50,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text('Residential', style: TextStyle(fontSize: 14, color: property==6? Colors.white: Colors.brown, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Divider(),

                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          select=2;
                          bed = 10;
                          bath = 10;
                          furnish = 3;
                          property = 7;
                          setState(() {

                          });
                        },
                        child: Container(
                          height: 44,
                          width: 150,
                          alignment: Alignment.center,
                          child: Text('Clean Filter', style: TextStyle(fontSize: 20, color: Colors.brown),),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.white),
                          overlayColor: MaterialStatePropertyAll(Colors.brown.shade100),
                          side: MaterialStatePropertyAll(BorderSide(color: Colors.brown, width: 2)),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          // propertyCategory.clear();
                          select_veri!=null && select_bath!=null && select_bed!=null && select_furnish!=null &&
                              select_property!=null && select_low!=null && select_high!=null?
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) =>
                                AdvanceFilter(
                                  verification: select_veri!,
                                  bed: select_bed!,
                                  bath: select_bath!,
                                  // start: select_low!,
                                  // end: select_high!,
                                  furnish: select_furnish!,
                                  type_name: select_property!,
                                ),)):
                          Fluttertoast.showToast(
                              msg: "All field selected required",
                              backgroundColor: Colors.grey,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                          setState(() {

                          });
                        },
                        child: Container(
                          height: 46,
                          width: 180,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text('Apply Filter', style: TextStyle(fontSize: 19, color: Colors.white),),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
