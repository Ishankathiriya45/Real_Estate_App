// import 'dart:html';

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:estate/api_data/get_api_data.dart';
import 'package:estate/floorplan.dart';
import 'package:estate/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:http/http.dart' as http;
import 'package:maps_launcher/maps_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'api_data/all_api.dart';

List itemList = [
  {
    'icon': Icons.abc,
    'name': '3 Beds'
  },
  {
    'icon': Icons.bathroom_outlined,
    'name': '2 Bath'
  },
  {
    'icon': Icons.fit_screen_outlined,
    'name': '1100 Sqft'
  },
  {
    'icon': Icons.table_restaurant_outlined,
    'name': 'Furnished'
  },
  {
    'icon': Icons.verified_user_outlined,
    'name': 'Verified'
  },
];

List amenities = [];

List imageList = [
   'assets/images/Bungalow.jpg',
   'assets/images/4Bungalow.jpg',
   'assets/images/3bungalow.jfif',
   'assets/images/Bungalow.jpg',
];

List relatedList = [
  {
    'image': 'assets/images/Bungalow.jpg',
    'color': Colors.green,
    'purpose': 'Rent',
    'view': '32',
    'price': 'Rs.90.00.000',
    'name': '3 BHK Bungalow',
    'address': 'Vesu Road, Vapi'
  },
  {
    'image': 'assets/images/Bungalow.jpg',
    'color': Colors.red,
    'purpose': 'Sell',
    'view': '32',
    'price': 'Rs.90.00.000',
    'name': '3 BHK Bungalow',
    'address': 'Vesu Road, Vapi'
  },
  {
    'image': 'assets/images/Bungalow.jpg',
    'color': Colors.green,
    'purpose': 'Rent',
    'view': '32',
    'price': 'Rs.90.00.000',
    'name': '3 BHK Bungalow',
    'address': 'Vesu Road, Vapi'
  },
];

var phone = categoryDetail[0]['phone'];
String hello = 'good';

class ItemPage extends StatefulWidget {
  int property_id;
   ItemPage({super.key, required this.property_id});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryDetail(hiveBox.get('user_id'), widget.property_id, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: categoryDetail.isEmpty? Center(child: CircularProgressIndicator()): CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            // leadingWidth: 80,
            expandedHeight: 300,
            snap: false,
            floating: false,
            backgroundColor: Colors.brown,

            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 42,
                    width: 42,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                    ),
                    child: Icon(Icons.arrow_back_ios_rounded, color: Colors.brown, size: 24,),
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  MapsLauncher.launchCoordinates(
                      double.parse(categoryDetail[0]['latitude']),double.parse(categoryDetail[0]['longitude']),);
                },
                child: Container(
                  height: 42,
                  width: 42,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                  ),
                  child:
                  Icon(Icons.location_on_outlined, color: Colors.brown, size: 30,),
                ),
              ),

              SizedBox(width: 10,),
              // Padding(
              //   padding: const EdgeInsets.only(right: 16),
              //   child: GestureDetector(
              //     onTap: () async {
              //       // popularProperty.clear();
              //       String ba64 = base64.encode(
              //           "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"user_id\":\"${hiveBox.get('user_id')}\",\"post_id\":\"${categoryDetail[0]['post_id']}\",\"post_type\":\"property\"}"
              //               .codeUnits);
              //
              //       final response = await http.post(
              //           Uri.parse(postFavouriteUrl),
              //           body: {
              //             'data': ba64,
              //           });
              //
              //       final data = jsonDecode(response.body);
              //       if(data['msg']=='Favourite successfully'){
              //         categoryDetail[0]['favourite']=true;
              //         print(categoryDetail[0]['favourite']);
              //         setState(() {
              //
              //         });
              //       }else{
              //         categoryDetail[0]['favourite']=false;
              //         print(categoryDetail[0]['favourite']);
              //         setState(() {
              //
              //         });
              //       }
              //       setState(() {
              //
              //       });
              //     },
              //     child: Container(
              //       height: 42,
              //       width: 42,
              //       alignment: Alignment.center,
              //       decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: Colors.white
              //       ),
              //       child: categoryDetail[0]['favourite']?
              //       Icon(Icons.bookmark, color: Colors.brown, size: 30,):
              //       Icon(Icons.bookmark_border, color: Colors.brown, size: 30,),
              //     ),
              //   ),
              // ),
            ],

            flexibleSpace: FlexibleSpaceBar(
                background: Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(categoryDetail[0]['post_image']),
                          fit: BoxFit.cover
                      ),
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 28,
                          width: 122,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius:
                              BorderRadius.circular(20)),
                          child: Text(
                              'Rs.${categoryDetail[0]['price']}',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),

                        Container(
                          height: 25,
                          width: 68,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(25)),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.visibility,
                                color: Colors.brown,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                '${categoryDetail[0]['total_views']}',
                                style: const TextStyle(
                                    color: Colors.brown,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                )
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(categoryDetail[0]['post_title'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined, color: Colors.brown,),
                                Expanded(child: Text(categoryDetail[0]['address'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 18),))
                              ],
                            )
                          ],
                        ),
                      ),
                      // Expanded(
                      //   child:
                      //   Container(
                      //     decoration: BoxDecoration(
                      //       color: Colors.brown.withOpacity(0.3),
                      //       shape: BoxShape.circle
                      //     ),
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(10.0),
                      //       child: Icon(Icons.book_online, size: 28, color: Colors.brown,),
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Share.share('com.example.estate');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.brown.withOpacity(0.3),
                                shape: BoxShape.circle
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(Icons.share_outlined, size: 28, color: Colors.brown,),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8,),
                  Divider(indent: 30,endIndent: 30,),

                  SizedBox(height: 10,),
                  SizedBox(
                    height: 85,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: [
                            Container(
                              // height: 110,
                              width: 70,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.brown.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.bed, size: 28, color: Colors.brown,),
                                  Text(categoryDetail[0]['bedrooms'], style: TextStyle(fontSize: 11, color: Colors.brown, fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              // height: 110,
                              width: 70,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.brown.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.bathtub_outlined, size: 28, color: Colors.brown,),
                                  SizedBox(height: 3,),
                                  Text(categoryDetail[0]['bathrooms'], style: TextStyle(fontSize: 11, color: Colors.brown, fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              // height: 110,
                              width: 70,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.brown.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.area_chart_outlined, size: 28, color: Colors.brown,),
                                  SizedBox(height: 3,),
                                  Text(categoryDetail[0]['area'], maxLines: 1, overflow: TextOverflow.visible, style: TextStyle(fontSize: 11, color: Colors.brown, fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              // height: 110,
                              width: 70,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.brown.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.table_bar_outlined, size: 28, color: Colors.brown,),
                                  SizedBox(height: 3,),
                                  Text(categoryDetail[0]['furnishing'], maxLines: 1, overflow: TextOverflow.visible, style: TextStyle(fontSize: 11, color: Colors.brown, fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              // height: 110,
                              width: 70,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.brown.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.verified_user_outlined, size: 28, color: Colors.brown,),
                                  SizedBox(height: 3,),
                                  Text(categoryDetail[0]['verified'], style: TextStyle(fontSize: 11, color: Colors.brown, fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20,),
                  Container(
                    height: 80,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(1,2))],
                        borderRadius: BorderRadius.circular(14)
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('assets/images/profile.png')
                              )
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // SizedBox(height: 16,),
                            Text('Owner', style: TextStyle(fontSize: 18),),
                            Text(categoryDetail[0]['user_name'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ],
                        ),

                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            // lunchWhatsapp(number: 6354290603, message: 'Hi I am ${hiveBox.get('name')}');
                            whatapp();
                          },
                          child: Container(
                            height: 46,
                            width: 46,
                            decoration: BoxDecoration(
                              color: Colors.green.shade200,
                              shape: BoxShape.circle,
                            ),
                            child:
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset('assets/images/whatsapp.png'),
                            ),
                          ),
                        ),
                        SizedBox(width: 8,),
                        GestureDetector(
                          onTap: () {
                            call();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.shade200,
                              shape: BoxShape.circle,
                            ),
                            child:
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(Icons.call, color: Colors.blueGrey, size: 26,),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 20,),
                  Text('Overview',style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HtmlWidget(categoryDetail[0]['post_description']),
                  ),

                  SizedBox(height: 10,),
                  Text('Amenities',style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Icon(Icons.label_important_outline),
                    Text(amenities[index], style: TextStyle(fontSize: 16),)
                  ],
                  ),
              );
            },
            childCount: amenities.length,
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text('Floor Plan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FloorPage(imageplanList: [],
                            imagename: categoryDetail[0]['floor_plan_image'], title: 'Floor Plan')));
                      },
                      child: Container(
                        child: CachedNetworkImage(
                          imageUrl: categoryDetail[0]['floor_plan_image'],
                          fit: BoxFit.cover, height: 240, width: 500,
                          placeholder: (context, url) => Center(child: Image.asset('assets/images/home_load.jpg', fit: BoxFit.cover,)),
                          errorWidget: (context, url, error) => Center(child: Icon(Icons.error, size: 30)),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Photos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FloorPage(imageplanList: categoryDetail[0]['gallery_list'],
                              imagename: categoryDetail[0]['gallery_list'][0]['gallery_image'], title: 'Property Photos'),));
                        },
                          child: Text('See All', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                    ],
                  ),

                  SizedBox(height: 16,),
                  SizedBox(
                    height: 170,
                    child: ListView.builder(
                      itemCount: categoryDetail[0]['gallery_list'].length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FloorPage(imageplanList: categoryDetail[0]['gallery_list'],
                                imagename: categoryDetail[0]['gallery_list'][index]['gallery_image'], title: 'Property Photos'),));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(categoryDetail[0]['gallery_list'][index]['gallery_image'],
                                fit: BoxFit.cover, height: 110, width: 150,),
                              // child: CachedNetworkImage(
                              //   imageUrl: categoryDetail[0]['gallery_list'][index]['gallery_image'],
                              //   fit: BoxFit.cover, height: 110, width: 150,
                              //   placeholder: (context, url) => Center(child: Image.asset('assets/images/home_load.jpg', fit: BoxFit.cover,)),
                              //   errorWidget: (context, url, error) => Center(child: Icon(Icons.error, size: 30)),
                              // ),
                            ),
                          )
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Related Property', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Text('See All', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                  ),

                  SizedBox(
                    height: 325,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                            //   categoryDetail.clear();
                            //   Navigator.push(context, MaterialPageRoute(builder: (context) => ItemPage(
                            //       property_id: categoryDetail[0]['related_property'][index]['post_id']),));
                            },
                            child: Container(
                              height: 315,
                              width: 250,
                              margin: const EdgeInsets.only(
                                  right: 12, bottom: 10, left: 10),
                              padding: const EdgeInsets.only(top: 10),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black26, offset: Offset(1, 1))
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CachedNetworkImage(imageUrl: categoryDetail[0]['related_property'][index]['post_image'],
                                          height: 210, width: 220,
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
                                            color: categoryDetail[0]['related_property'][index]['purpose']=='Sale'? Colors.red:Colors.green,
                                            borderRadius:
                                            BorderRadius.circular(25),
                                          ),
                                          child: Text(
                                            categoryDetail[0]['related_property'][index]['purpose'],
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
                                              Text('${categoryDetail[0]['related_property'][index]['total_views']}',
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
                                          child: Text('Rs.${categoryDetail[0]['related_property'][index]['price']}',
                                            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                                        ),
                                      )
                                    ],
                                  ),
                                  //SizedBox(height: 3,),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(categoryDetail[0]['related_property'][index]['post_title'],
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 20)),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.location_on_outlined,
                                                    color: Colors.brown,
                                                  ),
                                                  Expanded(
                                                      child: Text(
                                                          categoryDetail[0]['related_property'][index]
                                                          ['address'],
                                                          maxLines: 1,
                                                          overflow:
                                                          TextOverflow.ellipsis,
                                                          style: const TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 16))),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.brown.withOpacity(0.3),
                                            ),
                                            child: categoryDetail[0]['favourite']==false?
                                            Icon(Icons.bookmark_border, size: 32, color: Colors.brown,):
                                            Icon(Icons.bookmark, size: 32, color: Colors.brown,),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      },
                      itemCount: categoryDetail[0]['related_property'].length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // SizedBox(height: 10,),

        ],
      ),
    );
  }

  getCategoryDetail(int userId, int property_id, context) async {
    //cat_second
    String ba64 = base64.encode( "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"property_id\":\"$property_id\",\"user_id\":\"$userId\"}".codeUnits);

    try {
      final response = await http.post(
          Uri.parse(propertyDetailUrl),
          body: {
            'data': ba64,
          });

      if (response.statusCode == 200) {

        final data = jsonDecode(response.body);
        if (data['status_code'] ==200) {
          categoryDetail.add(data['REAL_ESTATE_APP']);
          splitlist();
          setState(() {

          });
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

    }
  }

  Future<void> whatapp() async {
    String url = "whatsapp://send?phone=$phone&text=$hello";

    await launch(url);
  }

  void call(){
    launch("tel://$phone");
  }

  void splitlist()async{
    final fileContent = await categoryDetail[0]['amenities'];
    amenities = fileContent!.split(',');
  print(amenities[0]);
  }
}
