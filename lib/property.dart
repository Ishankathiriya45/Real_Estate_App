import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:estate/edit_property.dart';
import 'package:estate/payment.dart';
import 'package:estate/profile.dart';
import 'package:estate/property_add.dart';
import 'package:flutter/material.dart';

import 'api_data/all_api.dart';
import 'api_data/get_api_data.dart';
import 'autentication/login.dart';
import 'demo.dart';
import 'favourite_post.dart';
import 'item_list.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

Map<String, dynamic> profileDetail = {};

class PropertyPage extends StatefulWidget {
  const PropertyPage({super.key});

  @override
  State<PropertyPage> createState() => _PropertyPageState();
}

class _PropertyPageState extends State<PropertyPage> {

  TextEditingController name = TextEditingController();
  File? imagefetch;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PropertyAddData.clear();
    EditPropertyData.clear();
      getUserProperty();
      showProfile();
      profileDetail.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
              PropertyAddData.isEmpty?
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
                      ),)
                  ],
                ),
              ):
              Expanded(
                child: GridView.builder(itemBuilder: (context, index){
                  return GestureDetector(onTap: () {
                    categoryDetail.clear();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ItemPage(
                        property_id: PropertyAddData[index]['post_id']),));
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
                                  child: CachedNetworkImage(imageUrl: PropertyAddData[index]['post_image'],
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
                                      color: PropertyAddData[index]['purpose']=='Sale'? Colors.red:Colors.green,
                                      borderRadius:
                                      BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      PropertyAddData[index]['purpose'],
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
                                        Text('${PropertyAddData[index]['total_views']}',
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
                                    child: Text('Rs.${PropertyAddData[index]['price']}',
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
                                      Text(PropertyAddData[index]['post_title'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
                                      Row(
                                        children: [
                                          Icon(Icons.location_on_outlined, color: Colors.brown,),
                                          Expanded(child: Text(PropertyAddData[index]['address'],maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16))),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        EditPropertyData.clear();
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => EditPropertyPage(postid: PropertyAddData[index]['post_id']),));
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
                                          child: Icon(Icons.update, size: 30, color: Colors.brown,)
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

                  itemCount: PropertyAddData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 268,
                      crossAxisSpacing: 3
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  
  getUserProperty() async {
    String ba64 = base64.encode("{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"user_id\":\"${hiveBox.get('user_id')}\"}".codeUnits);
    
    final response = await http.post(Uri.parse(UserPropertyUrl),
        body: {
          'data': ba64
        });
    if(response.statusCode == 200){
      setState(() {

      });
      final data = jsonDecode(response.body);
      if(data['status_code'] == 200){
        PropertyAddData = data['REAL_ESTATE_APP'];
        setState(() {

        });
      }else{
        print('Invalid Data');
      }
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
