import 'dart:convert';
// import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:estate/category.dart';
import 'package:estate/demo.dart';
import 'package:estate/item_list.dart';
import 'package:estate/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Navigator.dart';
import 'api_data/all_api.dart';
import 'api_data/get_api_data.dart';

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

class CatSecondPage extends StatefulWidget {
  var post_id;
  String property_title;
   CatSecondPage({required this.post_id, required this.property_title, super.key});

  @override
  State<CatSecondPage> createState() => _CatSecondPageState();
}

class _CatSecondPageState extends State<CatSecondPage> {

  late PersistentBottomSheetController _controller;

  int selected = 2;
  String bedroom = '3';

  bool categorydata = true;

  bool filter = true;

  bool select = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSecondCategoryData(hiveBox.get('user_id'), widget.post_id, context);
    propertyCategory.clear();
  }

  List choice = ["Non Verified Properties", "Verified Properties"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white70,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.all(7),
            child: Icon(Icons.arrow_back_ios_rounded, color: Colors.brown, size: 30,),
          ),
        ),

        title: Text(widget.property_title, style: TextStyle(fontSize: 21)),

        actions: [
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: FloatingActionButton(onPressed: () async{
                await showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(80), topLeft: Radius.circular(80))),
                  builder: (BuildContext context) {
                    return DemoPage();
                  },
                );
                setState(() {

                });
              },
              backgroundColor: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset('assets/images/filter.png'),
                ),
            ),
          )
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Text('Show By',  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),

                    SizedBox(width: 186,),
                    GestureDetector(
                      onTap: () {
                        select=true;
                        setState(() {

                        });
                      },
                      child: Container(
                        height: 46,
                        width: 46,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: select==true? Colors.brown: Colors.brown.shade200,
                            shape: BoxShape.circle
                        ),
                        child: Icon(Icons.category_outlined, color: select==true? Colors.white: Colors.brown, size: 30,),
                      ),
                    ),

                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: () {
                        select = false;
                        setState(() {

                        });
                      },
                      child: Container(
                        height: 46,
                        width: 46,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: select==false? Colors.brown: Colors.brown.shade200,
                            shape: BoxShape.circle
                        ),
                        child: Icon(Icons.menu_sharp, color: select==false? Colors.white: Colors.brown, size: 30,),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 20,),
              propertyCategory.isEmpty?Center(child: CircularProgressIndicator(),):
              Expanded(
                child: select==true? GridView.builder(itemBuilder: (context, index){
                  return GestureDetector(onTap: () {
                    categoryDetail.clear();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ItemPage(
                      property_id: propertyCategory[index]['post_id']
                    ),));
                  },
                    child: Container(
                      //height: 400,
                      //width: 300,
                      margin: EdgeInsets.all(5),
                      //padding: EdgeInsets.all(5),
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
                                    width: 66,
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
                                  flex: 4,
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
                                  child: GestureDetector(
                                    onTap: () async {
                                      // popularProperty.clear();
                                      String ba64 = base64.encode(
                                          "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"user_id\":\"${hiveBox.get('user_id')}\",\"post_id\":\"${propertyCategory[index]['post_id']}\",\"post_type\":\"property\"}"
                                              .codeUnits);

                                      final response = await http.post(
                                          Uri.parse(postFavouriteUrl),
                                          body: {
                                            'data': ba64,
                                          });

                                      final data = jsonDecode(response.body);
                                      if(data['msg']=='Favourite successfully'){
                                        propertyCategory[index]['favourite']=true;
                                        print(popularProperty[index]['favourite']);
                                        setState(() {

                                        });
                                      }else{
                                        propertyCategory[index]['favourite']=false;
                                        print(popularProperty[index]['favourite']);
                                        setState(() {

                                        });
                                      }
                                      setState(() {

                                      });
                                    },
                                    child: Container(
                                      height: 51,
                                      width: 51,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.brown.withOpacity(0.2),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: propertyCategory[index]['favourite']?
                                        Icon(Icons.bookmark, size: 32, color: Colors.brown,):
                                        Icon(Icons.bookmark_border, size: 32, color: Colors.brown,),
                                      ),
                                    ),
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
                      mainAxisExtent: 268,
                      crossAxisSpacing: 3
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                )
                    :
                ListView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        categoryDetail.clear();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ItemPage(
                            property_id:propertyCategory[index]['post_id']
                        ),));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 254,
                            //width: 300,
                            margin: EdgeInsets.all(5),
                            //padding: EdgeInsets.all(5),
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
                                          height: 175, width: 350,
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
                                          width: 66,
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
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(propertyCategory[index]['post_title'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
                                            SizedBox(height: 2,),
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
                                        child: GestureDetector(
                                          onTap: () async {
                                            // popularProperty.clear();
                                            String ba64 = base64.encode(
                                                "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"user_id\":\"${hiveBox.get('user_id')}\",\"post_id\":\"${popularProperty[index]['post_id']}\",\"post_type\":\"property\"}"
                                                    .codeUnits);

                                            final response = await http.post(
                                                Uri.parse(postFavouriteUrl),
                                                body: {
                                                  'data': ba64,
                                                });

                                            final data = jsonDecode(response.body);
                                            if(data['msg']=='Favourite successfully'){
                                              propertyCategory[index]['favourite']=true;
                                              print(popularProperty[index]['favourite']);
                                              setState(() {

                                              });
                                            }else{
                                              propertyCategory[index]['favourite']=false;
                                              print(popularProperty[index]['favourite']);
                                              setState(() {

                                              });
                                            }
                                            setState(() {

                                            });
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.brown.withOpacity(0.2),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(3.0),
                                              child: propertyCategory[index]['favourite']?
                                              Icon(Icons.bookmark, size: 32, color: Colors.brown,):
                                              Icon(Icons.bookmark_border, size: 32, color: Colors.brown,),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: propertyCategory.length,
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  getSecondCategoryData(int userId, int type_id, context) async {
    //cat_second
    String ba64 = base64.encode( "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"type_id\":\"$type_id\",\"user_id\":\"$userId\"}".codeUnits);

      final response = await http.post(
          Uri.parse(property_typeUrl),
          body: {
            'data': ba64,
          });

      print(response.statusCode);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final data = jsonDecode(response.body);
        if (data['status_code'] ==200) {
          propertyCategory = data['REAL_ESTATE_APP'];
          setState(() {

          });
        }
        else{
          print('Invalid Data');
        }
      } else {
        print('Invalid Data');
      }
  }
}
