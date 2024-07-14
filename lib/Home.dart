import 'dart:convert';
import 'dart:io';
// import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:estate/Navigator.dart';
import 'package:estate/api_data/all_api.dart';
import 'package:estate/autentication/login.dart';
import 'package:estate/category.dart';
import 'package:estate/favourite_post.dart';
import 'package:estate/latest_property.dart';
import 'package:estate/main.dart';
import 'package:estate/autentication/splash.dart';
import 'package:estate/payment.dart';
import 'package:estate/profile.dart';
import 'package:estate/search_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import 'api_data/get_api_data.dart';
import 'cat_second.dart';
import 'item_list.dart';

Map<String, dynamic> profileDetail = {};

List<String> purpose = [
  'Sale',
  'Rent',
];
List<String> cat = [
  'Apartment',
  'Commercial',
  'House',
  'Industrial',
  'Land',
  'Office',
  'Residential'
];

class Home extends StatefulWidget {
  Home({ super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? dropdownValue;
  int? dropdowncat;
  bool post = true;
  TextEditingController name = TextEditingController();
  TextEditingController error = TextEditingController(text: 'Name');
  File? imageshow;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPopularProperty(hiveBox.get('user_id'), context);
    getCategoryData(hiveBox.get('user_id'), context);
    getLatestProperty(hiveBox.get('user_id'), 'sort', context);
    propertyViewList.clear();
    showProfile();
    profileDetail.clear();
  }


  List category_name = [
    {
      'image': 'assets/images/aparts.png',
      'name': 'Apartment',
      'color': Colors.red
    },
    {
      'image': 'assets/images/commercial.png',
      'name': 'Commercial',
      'color': Colors.deepPurpleAccent
    },
    {
      'image': 'assets/images/house1.png',
      'name': 'House',
      'color': Colors.brown
    },
    {
      'image': 'assets/images/industrial.png',
      'name': 'Industrial',
      'color': Colors.cyan
    },
    {'image': 'assets/images/land.png', 'name': 'Land', 'color': Colors.green},
    {
      'image': 'assets/images/office.png',
      'name': 'Office',
      'color': Colors.pink
    },
    {
      'image': 'assets/images/residential.png',
      'name': 'Residential',
      'color': Colors.orange
    },
  ];

  List property = [
    {
      'image': 'assets/images/4Bungalow.jpg',
      'price': 'Rs.90.00.000',
      'name': '4 BHK Bungalow',
      'address': 'Varachha Road, Surat'
    },
    {
      'image': 'assets/images/semi_house.png',
      'price': 'Rs.12.00.000',
      'name': 'Semi-detched house',
      'address': 'VIP Road, Surat'
    },
    {
      'image': 'assets/images/retro.jpg',
      'price': 'Rs.50.00.000',
      'name': 'Retro House',
      'address': 'Ram Road, Ayodhya'
    },
    {
      'image': 'assets/images/3bungalow.jfif',
      'price': 'Rs.22.00.000',
      'name': '3 BHK Bungalow',
      'address': 'Vesu Road, Vapi'
    },
  ];

  List popular_property = [
    {
      'image': 'assets/images/3bungalow.jfif',
      'view': '32',
      'price': 'Rs.90.00.000',
      'name': '3 BHK Bungalow',
      'address': 'Vesu Road, Vapi'
    },
    {
      'image': 'assets/images/3bungalow.jfif',
      'view': '32',
      'price': 'Rs.90.00.000',
      'name': '3 BHK Bungalow',
      'address': 'Vesu Road, Vapi'
    },
    {
      'image': 'assets/images/3bungalow.jfif',
      'view': '32',
      'price': 'Rs.90.00.000',
      'name': '3 BHK Bungalow',
      'address': 'Vesu Road, Vapi'
    },
    {
      'image': 'assets/images/3bungalow.jfif',
      'view': '32',
      'price': 'Rs.90.00.000',
      'name': '3 BHK Bungalow',
      'address': 'Vesu Road, Vapi'
    },
    {
      'image': 'assets/images/4Bungalow.jpg',
      'view': '32',
      'price': 'Rs.90.00.000',
      'name': '3 BHK Bungalow',
      'address': 'Vesu Road, Vapi'
    },
    {
      'image': 'assets/images/4Bungalow.jpg',
      'view': '32',
      'price': 'Rs.90.00.000',
      'name': '3 BHK Bungalow',
      'address': 'Vesu Road, Vapi'
    },
    {
      'image': 'assets/images/4Bungalow.jpg',
      'view': '32',
      'price': 'Rs.90.00.000',
      'name': '3 BHK Bungalow',
      'address': 'Vesu Road, Vapi'
    },
    {
      'image': 'assets/images/4Bungalow.jpg',
      'view': '32',
      'price': 'Rs.90.00.000',
      'name': '3 BHK Bungalow',
      'address': 'Vesu Road, Vapi'
    },
    {
      'image': 'assets/images/4Bungalow.jpg',
      'view': '32',
      'price': 'Rs.90.00.000',
      'name': '3 BHK Bungalow',
      'address': 'Vesu Road, Vapi'
    },
    {
      'image': 'assets/images/4Bungalow.jpg',
      'view': '32',
      'price': 'Rs.90.00.000',
      'name': '3 BHK Bungalow',
      'address': 'Vesu Road, Vapi'
    },
    {
      'image': 'assets/images/4Bungalow.jpg',
      'view': '32',
      'price': 'Rs.90.00.000',
      'name': '3 BHK Bungalow',
      'address': 'Vesu Road, Vapi'
    },
    {
      'image': 'assets/images/4Bungalow.jpg',
      'view': '32',
      'price': 'Rs.90.00.000',
      'name': '3 BHK Bungalow',
      'address': 'Vesu Road, Vapi'
    },
  ];

  List latest_property = [
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 330,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(30)),
                    image: DecorationImage(
                        image: const AssetImage('assets/images/house1.jpeg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.brown.withOpacity(0.1), BlendMode.dstIn))),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                const Text(
                                  'Welcome Back!',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(profileDetail.isEmpty? error.text:name.text,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          SizedBox(width: 50,),
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
                                  child: imageshow==null?
                                  profileDetail['user_image']==null?
                                  Center(child: CircularProgressIndicator()):
                                  Image.network(profileDetail['user_image'], height: 60, width: 60, fit: BoxFit.cover,):
                                  Image.file(imageshow!, height: 60, width: 60, fit: BoxFit.cover,),
                                ),
                              ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text('Find your 500+ property',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 60,
                            width: 180,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.brown.shade700,
                            ),
//                           //child: Text('Select Purpose', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),

                            child: DropdownButton(
                              underline: const SizedBox(),
                              hint: const Text(
                                'Select purpose',
                                style: TextStyle(color: Colors.white),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down_outlined,
                                color: Colors.white,
                              ),
                              iconSize: 30,
                              dropdownColor: Colors.brown,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                              value: dropdownValue,
                              onChanged: (Values) {
                                setState(() {
                                  dropdownValue = Values as String;
                                });
                              },
                              items: purpose.map((valueitem) {
                                return DropdownMenuItem(
                                  value: valueitem,
                                  child: Text(valueitem),
                                );
                              }).toList(),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 180,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.brown.shade700,
                            ),
                            child: DropdownButton(
                                underline: const SizedBox(),
                                hint: const Text(
                                  'Select Category',
                                  style: TextStyle(color: Colors.white),
                                ),
                                icon: const Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: Colors.white,
                                ),
                                iconSize: 30,
                                dropdownColor: Colors.brown,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                                value: dropdowncat,
                              onChanged: (newVal){
                                setState(() {
                                  dropdowncat = newVal;
                                });
                              },

                              items: [
                                DropdownMenuItem(
                                  value: 1,
                                  child: Text('Apartment'),
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  child: Text('Commercial'),
                                ),
                                DropdownMenuItem(
                                  value: 3,
                                  child: Text('House'),
                                ),
                                DropdownMenuItem(
                                  value: 4,
                                  child: Text('Industrial'),
                                ),
                                DropdownMenuItem(
                                  value: 5,
                                  child: Text('Land'),
                                ),
                                DropdownMenuItem(
                                  value: 6,
                                  child: Text('Office'),
                                ),
                                DropdownMenuItem(
                                  value: 7,
                                  child: Text('Residential'),
                                ),
                              ],),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 60,
                        width: 600,
                        child: ElevatedButton(
                            onPressed: () {
                              // getSearchPropertyData();
                              propertyCategory.clear();
                              dropdownValue!=null && dropdowncat!=null?
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                  SearchDataPage(category: dropdowncat!, purpose: dropdownValue!),
                              )):
                              Fluttertoast.showToast(
                                  msg: "Select Purpose and Category",
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
                            style: ButtonStyle(
                                backgroundColor: const MaterialStatePropertyAll(
                                    Colors.black54),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)))),
                            child: const Text(
                              'Search Property',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            )),
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Category',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(),));
                    }, child: Text('See All', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown)),)
                  ],
                ),
              ),

              //SizedBox(height: 10,),
              categoryAll.isEmpty?Center(child: CircularProgressIndicator(),):
              SizedBox(
                  height: 50,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          propertyCategory.clear();
                          // print(index+1);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CatSecondPage(
                            post_id: categoryAll[index]['post_id'], property_title: categoryAll[index]['post_title']
                          ),));
                        },
                        child: Container(
                          //height: 50,
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                          margin: const EdgeInsets.fromLTRB(16, 0, 0, 2),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset.fromDirection(2, 1))
                              ]),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.network(
                                      categoryAll[index]['post_image']),
                                ),
                                height: 35,
                                width: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.9)),
                                ),
                              ),
                              //SizedBox(width: 2,),
                              Text(
                                categoryAll[index]['post_title'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: categoryAll.length > 5 ? 5 : categoryAll.length,
                    scrollDirection: Axis.horizontal,
                  )),

              //SizedBox(height: 10,),
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: const [
              //       Text('Recent Property',
              //           style: TextStyle(
              //               fontSize: 20, fontWeight: FontWeight.bold)),
              //     ],
              //   ),
              // ),
              //
              // SizedBox(
              //   height: 114,
              //   child: ListView.builder(
              //     itemBuilder: (context, index) {
              //       return GestureDetector(
              //         onTap: () {},
              //         child: Row(
              //           children: [
              //             Container(
              //               margin: const EdgeInsets.fromLTRB(16, 0, 0, 2),
              //               padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(20),
              //                   color: Colors.white,
              //                   boxShadow: [
              //                     BoxShadow(
              //                         color: Colors.black12,
              //                         offset: Offset.fromDirection(1, 2))
              //                   ]),
              //               child: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Row(
              //                   children: [
              //                     Container(
              //                       height: 90,
              //                       width: 90,
              //                       decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(20),
              //                           color: Colors.deepPurple,
              //                           image: DecorationImage(
              //                               image: AssetImage(
              //                                   property[index]['image']),
              //                               fit: BoxFit.cover)),
              //                       //child: Image.asset('assets/images/Bungalow.jpg'),
              //                     ),
              //                     const SizedBox(
              //                       width: 10,
              //                     ),
              //                     Column(
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.start,
              //                       children: [
              //                         Container(
              //                           height: 28,
              //                           width: 122,
              //                           alignment: Alignment.center,
              //                           decoration: BoxDecoration(
              //                               borderRadius:
              //                                   BorderRadius.circular(20),
              //                               color: Colors.brown),
              //                           child: Text(
              //                             property[index]['price'],
              //                             style: const TextStyle(
              //                                 fontSize: 16,
              //                                 color: Colors.white,
              //                                 fontWeight: FontWeight.bold),
              //                           ),
              //                         ),
              //                         const SizedBox(
              //                           height: 6,
              //                         ),
              //                         Text(
              //                           property[index]['name'],
              //                           style: const TextStyle(
              //                               fontSize: 16,
              //                               color: Colors.black,
              //                               fontWeight: FontWeight.bold),
              //                         ),
              //                         const SizedBox(
              //                           height: 6,
              //                         ),
              //                         Row(
              //                           children: [
              //                             const Icon(
              //                               Icons.location_on_outlined,
              //                               color: Colors.brown,
              //                             ),
              //                             Text(
              //                               property[index]['address'],
              //                               style: const TextStyle(
              //                                 fontSize: 15,
              //                                 color: Colors.black,
              //                               ),
              //                             ),
              //                           ],
              //                         )
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       );
              //     },
              //     itemCount: property.length,
              //     scrollDirection: Axis.horizontal,
              //   ),
              // ),

              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Popular Property',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),

              SizedBox(
                height: 280,
                child: popularProperty.isEmpty? Center(child: CircularProgressIndicator()): ListView.builder(
                  itemBuilder: (context, index) {

                    return GestureDetector(
                      onTap: () {
                        categoryDetail.clear();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ItemPage(
                            property_id: popularProperty[index]['post_id']),));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20,),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                    imageUrl: popularProperty[index]['post_image'], fit: BoxFit.cover, height: 300, width: 220,
                                    placeholder: (context, url) => Center(child: Image.asset('assets/images/home_load.jpg', fit: BoxFit.cover,)),
                                    errorWidget: (context, url, error) => Center(child: Icon(Icons.error, size: 30)),
                                  ),
                                ),

                                Positioned(
                                  top: 12,
                                    left: 10,
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
                                          popularProperty[index]['favourite']=true;
                                          print(popularProperty[index]['favourite']);
                                          setState(() {

                                          });
                                        }else{
                                          popularProperty[index]['favourite']=false;
                                          print(popularProperty[index]['favourite']);
                                          setState(() {

                                          });
                                        }
                                        setState(() {

                                        });
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: popularProperty[index]['favourite']?
                                          Icon(Icons.bookmark, size: 32, color: Colors.brown,):
                                          Icon(Icons.bookmark_border, size: 32, color: Colors.brown,),
                                        ),
                                      ),
                                    ),
                                ),
                                
                                Positioned(
                                  top: 12,
                                  right: 10,
                                    child: Container(
                                      height: 25,
                                      width: 72,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(25)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.visibility,
                                          color: Colors.brown,
                                        ),
                                        const SizedBox(width: 3,),
                                        Text('${popularProperty[index]['total_views']}', style: const TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),)
                                      ],
                                      ),
                                    ),
                                ),

                                Positioned(
                                  left: 10,
                                  bottom: 60,
                                    child: Container(
                                      height: 28,
                                      width: 122,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.brown,
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      child: Text(
                                          'Rs.${popularProperty[index]['price']}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                ),

                                Positioned(
                                  left: 10,
                                  bottom: 35,
                                    child: Text(
                                      popularProperty[index]['post_title'],
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                ),

                                Positioned(
                                  left: 10,
                                  bottom: 10,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          popularProperty[index]['address'],
                                          maxLines: 1, overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(fontSize: 15, color: Colors.white,),
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
                  itemCount: popularProperty.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Latest Property',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationPage(index: 1),));
                    }, child: Text('See All', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown)),)
                  ],
                ),
              ),

              //SizedBox(height: 2,),
              SizedBox(
                height: 325,
                child: latestPropertyMin.isEmpty? Center(child: CircularProgressIndicator()): ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {

                    getPropertyView() async {
                      String ba64 = base64.encode("{\"package_name\":\"com.example.realestate\",\"post_id\":\"${latestPropertyMin[index]['post_id']}\",\"post_type\":\"Property\"}".codeUnits);

                      final response = await http.post(Uri.parse(propertyViewUrl),
                          body: {
                            'data': ba64
                          }
                      );

                      if(response.statusCode==200){
                        final data = jsonDecode(response.body);
                        if(data['status_code']==200){
                          propertyViewList.add(data['REAL_ESTATE_APP']['views']);
                          setState(() {

                          });
                        }
                      }
                    }
                    getPropertyView();

                    return GestureDetector(
                        onTap: () {
                          categoryDetail.clear();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ItemPage(
                              property_id: latestPropertyMin[index]['post_id']),));
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
                                    child: CachedNetworkImage(imageUrl: latestPropertyMin[index]['post_image'],
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
                                          Text(latestPropertyMin[index]['post_title'],
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
                                                      latestPropertyMin[index]
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
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.brown.withOpacity(0.3),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: latestPropertyMin[index]['favourite']?
                                            Icon(Icons.bookmark, size: 32, color: Colors.brown,):
                                            Icon(Icons.bookmark_border, size: 32, color: Colors.brown,),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                  itemCount: latestPropertyMin.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getCategoryData(int userId, context) async {
    String ba64 = base64.encode(
        "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"user_id\":\"$userId\"}"
            .codeUnits);

      final response = await http.post(
          Uri.parse(categoryUrl),
          body: {
            'data': ba64,
          });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status_code'] == 200) {
          categoryAll = data['REAL_ESTATE_APP'];
          setState(() {

          });
        }
        else {
          print('Invalid Data');
        }
      }
  }

  getPopularProperty(int userId, context) async {
    String ba64 = base64.encode(
        "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"user_id\":\"$userId\"}"
            .codeUnits);

    final response = await http.post(
        Uri.parse(popular_propertyUrl),
        body:{
          'data':ba64
        });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status_code'] == 200) {
          popularProperty = data['REAL_ESTATE_APP'];

          for(int a=0; a<popularProperty.length; a++){
              String ba64 = base64.encode("{\"package_name\":\"com.example.realestate\",\"post_id\":\"${popularProperty[a]['post_id']}\",\"post_type\":\"Property\"}".codeUnits);

              final response = await http.post(Uri.parse(propertyViewUrl),
                  body: {
                    'data': ba64
                  }
              );

              if(response.statusCode==200){
                final data = jsonDecode(response.body);
                if(data['status_code']==200){
                  propertyViewList.add(data['REAL_ESTATE_APP']['views']);
                  setState(() {

                  });
                }
              }
          }
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

  getLatestProperty(int userId, String sort, context) async {

    String ba64 = base64.encode(
        "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"user_id\":\"$userId\",\"filter_by\":\"$sort\"}"
            .codeUnits);

      final response = await http.post(
          Uri.parse(latest_propertyMinUrl),
          body: {
            'data': ba64,
          });

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

  getNetworkImgae(){
    CachedNetworkImage(
      imageUrl: 'https://media.istockphoto.com/id/1645602428/photo/perfect-light-purple-and-pink-dahlia-enlarged-isolated-on-white-background.webp?b=1&s=170667a&w=0&k=20&c=Ie5-mXtynEFv_jaxS3fAzry7ZdEo88FJOrhlxMXoiiw=',
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Center(child: Icon(Icons.error, size: 30)),
    );
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
