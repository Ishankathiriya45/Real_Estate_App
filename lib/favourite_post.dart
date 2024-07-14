// import 'dart:html';

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:estate/Home.dart';
import 'package:estate/api_data/all_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_data/get_api_data.dart';
import 'item_list.dart';
import 'main.dart';

List cateList = [
  {
    'image': 'assets/images/Bungalow.jpg',
    'purpose': 'Rent',
    'view': '32',
    'price': 'Rs.90.00.000',
    'name' : '3 BHK Bungalow',
    'address' : 'Vesu Road, Vapi'
  },
  {
    'image': 'assets/images/Bungalow.jpg',
    'purpose': 'Rent',
    'view': '32',
    'price': 'Rs.90.00.000',
    'name' : '3 BHK Bungalow',
    'address' : 'Vesu Road, Vapi'
  },
  {
    'image': 'assets/images/Bungalow.jpg',
    'purpose': 'Rent',
    'view': '32',
    'price': 'Rs.90.00.000',
    'name' : '3 BHK Bungalow',
    'address' : 'Vesu Road, Vapi'
  },
  {
    'image': 'assets/images/Bungalow.jpg',
    'purpose': 'Rent',
    'view': '32',
    'price': 'Rs.90.00.000',
    'name' : '3 BHK Bungalow',
    'address' : 'Vesu Road, Vapi'
  },
  {
    'image': 'assets/images/Bungalow.jpg',
    'purpose': 'Rent',
    'view': '32',
    'price': 'Rs.90.00.000',
    'name' : '3 BHK Bungalow',
    'address' : 'Vesu Road, Vapi'
  },
  {
    'image': 'assets/images/Bungalow.jpg',
    'purpose': 'Rent',
    'view': '32',
    'price': 'Rs.90.00.000',
    'name' : '3 BHK Bungalow',
    'address' : 'Vesu Road, Vapi'
  },
  {
    'image': 'assets/images/Bungalow.jpg',
    'purpose': 'Rent',
    'view': '32',
    'price': 'Rs.90.00.000',
    'name' : '3 BHK Bungalow',
    'address' : 'Vesu Road, Vapi'
  },
  {
    'image': 'assets/images/Bungalow.jpg',
    'purpose': 'Rent',
    'view': '32',
    'price': 'Rs.90.00.000',
    'name' : '3 BHK Bungalow',
    'address' : 'Vesu Road, Vapi'
  },
];

class FavouritePostPage extends StatefulWidget {
  const FavouritePostPage({super.key});

  @override
  State<FavouritePostPage> createState() => _FavouritePostPageState();
}

class _FavouritePostPageState extends State<FavouritePostPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFavouritePostList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        automaticallyImplyLeading: true,
        title: Text('Favourite Property', style: TextStyle(color: Colors.white, fontSize: 20),),
      ),
      
      body: FavouriteDetail.isEmpty?
      Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/nohome.png'),
                    fit: BoxFit.cover
                  )
                ),
              ),
              SizedBox(height: 10,),
              Text('No Save Property', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey),),
            ],
          ),
      ):
      GridView.builder(
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: () {

            },
            child: Container(
              // height: 258,
              // width: 196,
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
                          child: CachedNetworkImage(imageUrl: FavouriteDetail[index]['post_image'],
                            height: 166, width: 165,
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
                              color: FavouriteDetail[index]['purpose']=='Sale'? Colors.red:Colors.green,
                              borderRadius:
                              BorderRadius.circular(25),
                            ),
                            child: Text(
                              FavouriteDetail[index]['purpose'],
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
                                Text('${FavouriteDetail[index]['total_views']}',
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
                            child: Text('Rs.${FavouriteDetail[index]['price']}',
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
                              Text(FavouriteDetail[index]['post_title'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined, color: Colors.brown,),
                                  Expanded(child: Text(FavouriteDetail[index]['address'],maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16))),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Container(
                          // height: 30,
                          // width: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.brown.withOpacity(0.2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: FavouriteDetail[index]['favourite']? Icon(Icons.bookmark, size: 32, color: Colors.brown,):
                            Icon(Icons.bookmark_border, size: 32, color: Colors.brown,),
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
        itemCount: FavouriteDetail.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 258,
            crossAxisSpacing: 3
        ),
        // shrinkWrap: true,
      )
    );
  }

  getFavouritePostList() async {
    String ba64 = base64.encode("{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"user_id\":\"${hiveBox.get('user_id')}\"}"
        .codeUnits);

    print('hello');
    final response = await http.post(
      Uri.parse(postFavouriteListUrl),
      body:{
        'data':ba64
    });

    print(ba64);
    final data = jsonDecode(response.body);
    if(data['status_code']==200){
      FavouriteDetail = data['REAL_ESTATE_APP'];
      setState(() {

      });
    }else{
      Navigator.pop(context);
      const snackBar = SnackBar(
        content: Text('Data is Invalid'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
