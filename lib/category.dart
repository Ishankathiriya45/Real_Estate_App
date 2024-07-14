import 'dart:convert';
import 'dart:io';

import 'package:estate/api_data/get_api_data.dart';
import 'package:estate/cat_second.dart';
import 'package:estate/main.dart';
import 'package:estate/payment.dart';
import 'package:estate/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'api_data/all_api.dart';
import 'autentication/login.dart';
import 'favourite_post.dart';

Map<String, dynamic> profileDetail = {};

class CategoryPage extends StatefulWidget {

   CategoryPage({super.key,});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController name = TextEditingController();
  File? imagefetch;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showProfileData();
    profileDetail.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8,),
                        Text('Welcome Back!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Text(name.text, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),),
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
              categoryAll.isEmpty?Center(child: CircularProgressIndicator(),):
              Expanded(
                child: GridView.builder(itemBuilder: (context, index){
                  return GestureDetector(onTap: () {
                    propertyCategory.clear();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CatSecondPage(
                        post_id: categoryAll[index]['post_id'], property_title: categoryAll[index]['post_title']),));
                  },
                    child: Column(
                      children: [
                        Container(
                          height: 162,
                          width: 184,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 2.0)]
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 16,),
                              Container(
                                height: 76,
                                width: 76,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey.shade300)
                                ),
                                child: Image.network(categoryAll[index]['post_image'], height: 38, width: 38,),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                height: 40,
                                width: 166,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text(categoryAll[index]['post_title'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                  itemCount: categoryAll.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 176,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  showProfileData() async {
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
