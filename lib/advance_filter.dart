import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:estate/api_data/get_api_data.dart';
import 'package:estate/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_data/all_api.dart';

class AdvanceFilter extends StatefulWidget {
  String verification;
  // double start;
  // double end;
  int bed;
  int bath;
  String furnish;
  int type_name;
  AdvanceFilter({required this.type_name, required this.verification, required this.bed, required this.bath, required this.furnish, super.key});


  @override
  State<AdvanceFilter> createState() => _AdvanceFilterState();
}

class _AdvanceFilterState extends State<AdvanceFilter> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFilterProperty(widget.verification, widget.bed, widget.bath, widget.furnish, widget.type_name);
    propertyCategory.clear();
  }

  List cateList = [
    {
      'image': 'assets/images/Bungalow.jpg',
      'color': Colors.green,
      'purpose': 'Rent',
      'view': '32',
      'price': 'Rs.90.00.000',
      'name' : '3 BHK Bungalow',
      'address' : 'Vesu Road, Vapi'
    },
    {
      'image': 'assets/images/Bungalow.jpg',
      'color': Colors.green,
      'purpose': 'Rent',
      'view': '32',
      'price': 'Rs.90.00.000',
      'name' : '3 BHK Bungalow',
      'address' : 'Vesu Road, Vapi'
    },
    {
      'image': 'assets/images/Bungalow.jpg',
      'color': Colors.green,
      'purpose': 'Rent',
      'view': '32',
      'price': 'Rs.90.00.000',
      'name' : '3 BHK Bungalow',
      'address' : 'Vesu Road, Vapi'
    },
    {
      'image': 'assets/images/Bungalow.jpg',
      'color': Colors.green,
      'purpose': 'Rent',
      'view': '32',
      'price': 'Rs.90.00.000',
      'name' : '3 BHK Bungalow',
      'address' : 'Vesu Road, Vapi'
    },
    {
      'image': 'assets/images/Bungalow.jpg',
      'color': Colors.green,
      'purpose': 'Rent',
      'view': '32',
      'price': 'Rs.90.00.000',
      'name' : '3 BHK Bungalow',
      'address' : 'Vesu Road, Vapi'
    },
    {
      'image': 'assets/images/Bungalow.jpg',
      'color': Colors.green,
      'purpose': 'Rent',
      'view': '32',
      'price': 'Rs.90.00.000',
      'name' : '3 BHK Bungalow',
      'address' : 'Vesu Road, Vapi'
    },
    {
      'image': 'assets/images/Bungalow.jpg',
      'color': Colors.green,
      'purpose': 'Rent',
      'view': '32',
      'price': 'Rs.90.00.000',
      'name' : '3 BHK Bungalow',
      'address' : 'Vesu Road, Vapi'
    },
    {
      'image': 'assets/images/Bungalow.jpg',
      'color': Colors.green,
      'purpose': 'Rent',
      'view': '32',
      'price': 'Rs.90.00.000',
      'name' : '3 BHK Bungalow',
      'address' : 'Vesu Road, Vapi'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
            child: Icon(Icons.arrow_back_ios_rounded, color: Colors.brown,)),
        title: Text('Advance Filter Property', style: TextStyle(fontSize: 20, color: Colors.black),),
      ),
      body: SafeArea(
        child: Column(
          children: [
            propertyCategory.isEmpty?
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 260),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/nohome.png'),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text('Not Available Property', style: TextStyle(fontSize: 22, color: Colors.black45, fontWeight: FontWeight.bold),),
                ],
              ),
            ):
            Expanded(
              child: GridView.builder(
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      // height: 260,
                      // width: 200,
                      margin: EdgeInsets.all(3),
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(1, 1))]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 12,),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(imageUrl: propertyCategory[index]['post_image'],
                                    height: 175, width: 170,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Center(child: Image.asset('assets/images/home_load.jpg', fit: BoxFit.cover,)),
                                    errorWidget: (context, url, error) => Center(child: Icon(Icons.error, size: 30)),
                                  ),
                                ),
                                Positioned(
                                  top: 12,
                                  left: 10,
                                  child: Container(
                                    height: 25,
                                    width: 52,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: propertyCategory[index]['purpose']=='Sale'? Colors.red:Colors.green,
                                      borderRadius:
                                      BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      propertyCategory[index]['purpose'],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 12,
                                  right: 10,
                                  child: Container(
                                    height: 25,
                                    width: 72,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.remove_red_eye, color: Colors.brown),
                                        SizedBox(width: 3,),
                                        Text('${propertyCategory[index]['total_views']}',
                                          style: const TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 12,
                                  left: 10,
                                  child: Container(
                                    height: 28,
                                    width: 122,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.brown,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text('Rs.${propertyCategory[index]['price']}',
                                      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                                  ),
                                )
                              ],
                            ),
                          ),

                          //SizedBox(height: 3,),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(propertyCategory[index]['post_title'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
                                      Row(
                                        children: [
                                          Icon(Icons.location_on_outlined, color: Colors.brown,),
                                          Expanded(child: Text(propertyCategory[index]['address'],maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16))),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Expanded(
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.brown.withOpacity(0.2),
                                    ),
                                    child: propertyCategory[index]['favourite']?
                                    Icon(Icons.bookmark, size: 32, color: Colors.brown,):
                                    Icon(Icons.bookmark_border, size: 32, color: Colors.brown,),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },

                itemCount: propertyCategory.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 273,
                    crossAxisSpacing: 3
                ),
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      )
    );
  }

  getFilterProperty(String verified, int bed, int bath, String furnish, int typeId) async {
    String ba64 = base64.encode(
          "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"user_id\":\"${hiveBox.get('user_id')}\",\"verified\":\"$verified\",\"bedrooms\":\"$bed\",\"bathrooms\":\"$bath\",\"furnishing\":\"$furnish\",\"type_id\":\"$typeId\"}"
              .codeUnits);

        final response = await http.post(
            Uri.parse(search_propertyUrl),
            body: {
              'data': ba64,
            });

        print('----data-----$ba64');
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);

          if (data['status_code'] == 200) {
            propertyCategory = data['REAL_ESTATE_APP'];
            print('--------adv_fil=======$propertyCategory');
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
}
