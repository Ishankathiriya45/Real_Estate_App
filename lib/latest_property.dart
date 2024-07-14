import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:estate/Home.dart';
import 'package:estate/api_data/get_api_data.dart';
import 'package:estate/main.dart';
import 'package:estate/payment.dart';
import 'package:estate/profile.dart';
import 'package:flutter/material.dart';

import 'Navigator.dart';
import 'api_data/all_api.dart';
import 'package:http/http.dart' as http;

import 'autentication/login.dart';
import 'demo.dart';
import 'favourite_post.dart';
import 'item_list.dart';

Map<String, dynamic> profileDetail = {};

List<String> sortest = ['Price - High to Low', 'Price - Low to High'];

List latest = [
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
    'color': Colors.red,
    'purpose': 'Sell',
    'view': '32',
    'price': 'Rs.90.00.000',
    'name' : '3 BHK Bungalow',
    'address' : 'Vesu Road, Vapi'
  },
  {
    'image': 'assets/images/Bungalow.jpg',
    'color': Colors.green,
    'purpose': 'Sell',
    'view': '32',
    'price': 'Rs.90.00.000',
    'name' : '3 BHK Bungalow',
    'address' : 'Vesu Road, Vapi'
  },
  {
    'image': 'assets/images/Bungalow.jpg',
    'color': Colors.green,
    'purpose': 'Sell',
    'view': '32',
    'price': 'Rs.90.00.000',
    'name' : '3 BHK Bungalow',
    'address' : 'Vesu Road, Vapi'
  },
  {
    'image': 'assets/images/Bungalow.jpg',
    'color': Colors.red,
    'purpose': 'Sell',
    'view': '32',
    'price': 'Rs.90.00.000',
    'name' : '3 BHK Bungalow',
    'address' : 'Vesu Road, Vapi'
  },
  {
    'image': 'assets/images/Bungalow.jpg',
    'color': Colors.green,
    'purpose': 'Sell',
    'view': '32',
    'price': 'Rs.90.00.000',
    'name' : '3 BHK Bungalow',
    'address' : 'Vesu Road, Vapi'
  },
  {
    'image': 'assets/images/Bungalow.jpg',
    'color': Colors.red,
    'purpose': 'Sell',
    'view': '32',
    'price': 'Rs.90.00.000',
    'name' : '3 BHK Bungalow',
    'address' : 'Vesu Road, Vapi'
  },
  {
    'image': 'assets/images/Bungalow.jpg',
    'color': Colors.green,
    'purpose': 'Sell',
    'view': '32',
    'price': 'Rs.90.00.000',
    'name' : '3 BHK Bungalow',
    'address' : 'Vesu Road, Vapi'
  },
];

class LatestPage extends StatefulWidget {
  const LatestPage({super.key});

  @override
  State<LatestPage> createState() => _LatestPageState();
}

class _LatestPageState extends State<LatestPage> {
  List<int>? filterIndex;
  TextEditingController name = TextEditingController();
  File? imagefetch;

  bool select = true;

  String? downsort;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLatestProperty(hiveBox.get('user_id'), 'sort', context);
    showProfile();
    profileDetail.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8,),
                        Text('Welcome Back!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Text(name.text, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  SizedBox(width: 60,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Colors.white54
                    ),
                    onPressed: () async{
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/filter.png', height: 30, width: 30,),
                    ),
                  ),

                  Expanded(
                    child: SubmenuButton(
                      menuChildren: [
                        Container(
                          height: 26,
                          child: MenuItemButton(child: Text('Edit Profile'),
                            onPressed: () {
                              profileDetail.clear();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),));
                            },
                          ),
                        ),
                        Divider(),
                        Container(
                          height: 26,
                          child: MenuItemButton(child: Text('Favorite Property'),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => FavouritePostPage(),));
                            },
                          ),
                        ),
                        // Divider(),
                        // Container(
                        //   height: 26,
                        //   child: MenuItemButton(child: Text('My Subscription'),
                        //     onPressed: () {
                        //       Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage(),));
                        //     },
                        //   ),
                        // ),
                        Divider(),
                        Container(
                          height: 26,
                          child: MenuItemButton(child: Text('Logout'),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                            },
                          ),
                        ),
                      ],
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: imagefetch==null?
                        profileDetail['user_image']==null?
                        Center(child: CircularProgressIndicator()):
                        Image.network(profileDetail['user_image'], height: 60, width: 60, fit: BoxFit.cover,):
                        Image.file(imagefetch!, height: 60, width: 60, fit: BoxFit.cover,),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20,),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Container(
                      height: 54,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.brown.shade200
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        // Text('Sort By', style: TextStyle(color: Colors.brown.shade700, fontSize: 18, fontWeight: FontWeight.bold),),
                        // Icon(Icons.arrow_drop_down, color: Colors.brown, size: 46,),
                        DropdownButton(
                          hint: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Sort By', style: TextStyle(color: Colors.brown.shade700, fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                            icon: Icon(Icons.arrow_drop_down, color: Colors.brown, size: 46,),
                            items: sortest.map((values){
                              return DropdownMenuItem(
                                value: values,
                                  child: Text(values)
                              );
                            }).toList(),
                            onChanged: (String? newvalue){
                              print('price list $newvalue');
                              latestPropertyMin.clear();
                              if(newvalue=='Price - High to Low'){
                                getLatestProperty(hiveBox.get('user_id'),'price_high',context);
                              }else if(newvalue=='Price - Low to High'){
                                getLatestProperty(hiveBox.get('user_id'),'price_low',context);
                              }
                              setState(() {

                              });
                            }
                        )
                        ],
                      )
                    ),
                    SizedBox(width: 70,),
                    GestureDetector(
                      onTap: () {
                        select = true;
                        setState(() {

                        });
                      },
                      child: Container(
                        height: 46,
                        width: 46,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: select==true? Colors.brown:Colors.brown.shade200
                        ),
                        child: Icon(Icons.category_outlined, color: select==true? Colors.white:Colors.brown, size: 30,),
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
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: select==false? Colors.brown: Colors.brown.shade200
                        ),
                        child: Icon(Icons.menu_sharp, color: select==false? Colors.white:Colors.brown, size: 34,),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 20,),
              latestPropertyMin.isEmpty? Center(child: CircularProgressIndicator()): Expanded(
                child: select==true? GridView.builder(itemBuilder: (context, index){
                  return GestureDetector(onTap: () {
                    categoryDetail.clear();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ItemPage(
                        property_id: latestPropertyMin[index]['post_id']),));
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
                                  child: CachedNetworkImage(imageUrl: latestPropertyMin[index]['post_image'],
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
                                      color: latestPropertyMin[index]['purpose']=='Sale'? Colors.red:Colors.green,
                                      borderRadius:
                                      BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      latestPropertyMin[index]['purpose'],
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
                                        Text('${latestPropertyMin[index]['total_views']}',
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
                                    child: Text('Rs.${latestPropertyMin[index]['price']}',
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
                                      Text(latestPropertyMin[index]['post_title'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
                                      Row(
                                        children: [
                                          Icon(Icons.location_on_outlined, color: Colors.brown,),
                                          Expanded(child: Text(latestPropertyMin[index]['address'],maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16))),
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
                                          "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"user_id\":\"${hiveBox.get('user_id')}\",\"post_id\":\"${latestPropertyMin[index]['post_id']}\",\"post_type\":\"property\"}"
                                              .codeUnits);

                                      final response = await http.post(
                                          Uri.parse(postFavouriteUrl),
                                          body: {
                                            'data': ba64,
                                          });

                                      final data = jsonDecode(response.body);
                                      if(data['msg']=='Favourite successfully'){
                                        latestPropertyMin[index]['favourite']=true;
                                        print(popularProperty[index]['favourite']);
                                        setState(() {

                                        });
                                      }else{
                                        latestPropertyMin[index]['favourite']=false;
                                        print(popularProperty[index]['favourite']);
                                        setState(() {

                                        });
                                      }
                                      setState(() {

                                      });
                                    },
                                    child: Container(
                                      // height: 50,
                                      // width: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.brown.withOpacity(0.2),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: latestPropertyMin[index]['favourite']?
                                        Icon(Icons.bookmark, size: 30, color: Colors.brown,):
                                        Icon(Icons.bookmark_border, size: 30, color: Colors.brown,),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },

                  itemCount: latestPropertyMin.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 268,
                      crossAxisSpacing: 3
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                ):
                ListView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        categoryDetail.clear();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ItemPage(
                            property_id:latestPropertyMin[index]['post_id']
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
                                        child: CachedNetworkImage(imageUrl: latestPropertyMin[index]['post_image'],
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
                                            color: latestPropertyMin[index]['purpose']=='Sale'? Colors.red:Colors.green,
                                            borderRadius:
                                            BorderRadius.circular(25),
                                          ),
                                          child: Text(
                                            latestPropertyMin[index]['purpose'],
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
                                              Text('${latestPropertyMin[index]['total_views']}',
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
                                          child: Text('Rs.${latestPropertyMin[index]['price']}',
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
                                            Text(latestPropertyMin[index]['post_title'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
                                            SizedBox(height: 2,),
                                            Row(
                                              children: [
                                                Icon(Icons.location_on_outlined, color: Colors.brown,),
                                                Expanded(child: Text(latestPropertyMin[index]['address'],maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16))),
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
                                                "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"user_id\":\"${hiveBox.get('user_id')}\",\"post_id\":\"${latestPropertyMin[index]['post_id']}\",\"post_type\":\"property\"}"
                                                    .codeUnits);

                                            final response = await http.post(
                                                Uri.parse(postFavouriteUrl),
                                                body: {
                                                  'data': ba64,
                                                });

                                            final data = jsonDecode(response.body);
                                            if(data['msg']=='Favourite successfully'){
                                              latestPropertyMin[index]['favourite']=true;
                                              print(latestPropertyMin[index]['favourite']);
                                              setState(() {

                                              });
                                            }else{
                                              latestPropertyMin[index]['favourite']=false;
                                              print(latestPropertyMin[index]['favourite']);
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
                                              child: latestPropertyMin[index]['favourite']?
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
                  itemCount: latestPropertyMin.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  getLatestProperty(int userId, String sort, context) async {
    String ba64 = base64.encode(
        "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"user_id\":\"$userId\",\"filter_by\":\"$sort\"}"
            .codeUnits);

      final response = await http.post(
          Uri.parse(latest_propertyMinUrl),
          body: {
            'data': ba64,
          });

      print(response.statusCode);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status_code'] == 200) {
          latestPropertyMin = data['REAL_ESTATE_APP'];
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

  showProfile() async {
    String ba64 = base64.encode("{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"user_id\":\"${hiveBox.get('user_id')}\"}".codeUnits);

    final response = await http.post(Uri.parse(profiledataUrl),
        body: {
          'data': ba64
        }
    );

    if(response.statusCode==200){
      final data = jsonDecode(response.body);

      if(data['status_code']==200){
        profileDetail = data['REAL_ESTATE_APP'];
        name.text = profileDetail['name'];
        setState(() {

        });
      }
    }
  }
}
