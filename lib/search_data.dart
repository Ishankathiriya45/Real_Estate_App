// import 'dart:html';

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:estate/item_list.dart';
import 'package:flutter/material.dart';

import 'api_data/all_api.dart';
import 'api_data/get_api_data.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class SearchDataPage extends StatefulWidget {
  int category;
  String purpose;
   SearchDataPage({required this.category, required this.purpose, super.key});

  @override
  State<SearchDataPage> createState() => _SearchDataPageState();
}

class _SearchDataPageState extends State<SearchDataPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchPropertyData(widget.category, widget.purpose);
    // propertyCategory.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Search Data', style: TextStyle(fontSize: 21),),
      ),

      body: propertyCategory.isEmpty? Center(child: CircularProgressIndicator()): GridView.builder(
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ItemPage(
                  property_id: propertyCategory[index]['post_id']),
              ));
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
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(imageUrl: propertyCategory[index]['post_image'],
                          height: 165, width: 170,
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(propertyCategory[index]['post_title'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined, color: Colors.brown,),
                                  Expanded(child: Text(propertyCategory[index]['address'],maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16))),
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
                            child: propertyCategory[index]['favourite']? Icon(Icons.bookmark, size: 32, color: Colors.brown,):
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
        itemCount: propertyCategory.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 258,
            crossAxisSpacing: 3
        ),
      ),
    );
  }

  getSearchPropertyData(int type_id, String purposes) async {
    String ba64 = base64.encode("{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"user_id\":\"${hiveBox.get('user_id')}\",\"type_id\":\"$type_id\",\"purpose\":\"$purposes\"}".codeUnits);

    final response = await http.post(
        Uri.parse(searchPropertyListUrl),
        body: {
          'data':ba64
        }
    );

    print('---data++++++$ba64');
    final data = jsonDecode(response.body);
    if(data['status_code']==200){
      propertyCategory = data['REAL_ESTATE_APP'];
      print('--------ser_List+++++++$propertyCategory');
      setState(() {

      });
    }else{
      print('Invalid Data');
    }
  }
}
