import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'all_api.dart';

class APICheck extends StatefulWidget {
  const APICheck({super.key});

  @override
  State<APICheck> createState() => _APICheckState();
}

class _APICheckState extends State<APICheck> {

  // int _value = 1;
  File? imageFile;
  @override

  Future<void> initState() async {
    // TODO: implement initState
    super.initState();

    // String ba64 = base64.encode(
    //     "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"user_id\":\"5\",\"verified\":\"YES\",\"price_start\":\"2000000\",\"price_end\":\"11000000\",\"bedrooms\":\"1\",\"bathrooms\":\"1\",\"furnishing\":\"Semi-Furnished\",\"type_id\":\"1\"}"
    //         .codeUnits);
    // String make = "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"user_id\":\"5\"}";
     String make = "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"user_id\":\"5\",\"verified\":\"Yes\",\"price_start\":\"600000\",\"price_end\":\"800000\",\"bedrooms\":\"2\",\"bathrooms\":\"2\",\"furnishing\":\"Furnished\",\"type_id\":\"1\"}";
    // String make = "{\"package_name\":\"com.example.realestate\",\"email\":\"deep@gmail.com\"}";
    // String make = "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"post_id\":\"64\",\"user_id\":\"5\",\"type_id\":\"1\",\"title\":\"Bungalow Resort\",\"description\":\"The HillsThe Hills is a spacious 4-BHK with 1-Lifestyle\",\"phone\":\"9898989895\",\"address\":\"madvi, rajkot\",\"latitude\":\"22.278070\",\"longitude\":\"70.765960\",\"purpose\":\"Sale\",\"bedrooms\":\"2\",\"bathrooms\":\"2\",\"area\":\"1200 Sq-ft\",\"furnishing\":\"Unfurnished\",\"amenities\":\"lift\",\"price\":\"600000\",\"verified\":\"NO\"}";

    print(make);
    String ba64 = base64.encode(make.codeUnits);
    print("data in base64----dfefdfs------->>>>>"+ba64);
    
    final response = http.post(Uri.parse(forgotPasswordUrl),
      body:{
      'data': ba64
        }
    );
    
    // var request = http.MultipartRequest('POST', Uri.parse(propertyAddDataUrl));
    // request.fields['data'] = ba64;
    // request.files.add(await http.MultipartFile.fromPath('featured_image', imageFile!.path));
    // request.files.add(await http.MultipartFile.fromPath('floor_plan_image', imageFile!.path));
    // request.files.add(await http.MultipartFile.fromPath('image_gallery', imageFile!.path));

    // final response = await request.send();
    // final responseString = await response.stream.bytesToString();
    print(ba64);
    // print("data in base64----dfefdfs------->>>>>"+responseString);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(

          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('cscscsd', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined, color: Colors.brown,),
                            Expanded(child: Text('cdccdcdd',maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 16))),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Container(
                      height: 51,
                      width: 51,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.brown.withOpacity(0.5),
                          image: DecorationImage(
                              image: AssetImage('assets/images/save.png')
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}
