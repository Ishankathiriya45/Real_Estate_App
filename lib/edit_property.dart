import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:estate/Navigator.dart';
import 'package:estate/api_data/get_api_data.dart';
import 'package:estate/main.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'api_data/all_api.dart';

class EditPropertyPage extends StatefulWidget {
  int postid;
  EditPropertyPage({required this.postid, super.key});

  @override
  State<EditPropertyPage> createState() => _EditPropertyPageState();
}

class _EditPropertyPageState extends State<EditPropertyPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    editUserProperty(widget.postid);
  }

  int? dropdowncat;
  String? dropdownpur;
  String? dropdownfur;
  File? imageFile;
  File? imageFloor;
  File? gallery;
  TextEditingController title = TextEditingController();
  TextEditingController discription = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController lati = TextEditingController();
  TextEditingController longi = TextEditingController();
  TextEditingController bed = TextEditingController();
  TextEditingController bath = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController amenities = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];
  List<String> imageFiles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        automaticallyImplyLeading: true,
        title: Text('Update Properties', style: TextStyle(fontSize: 21),),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16,),
                Container(
                  height: 54,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Colors.brown.shade50,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.brown, blurRadius: 1.0)],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      hint: Text('Select Category', style: TextStyle(fontWeight: FontWeight.bold),),

                      value: dropdowncat,
                      onChanged: (int? newVal){
                        setState(() {
                          dropdowncat = newVal as int;
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
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 16,),
                Container(
                  height: 54,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Colors.brown.shade50,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.brown, blurRadius: 1.0)],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      hint: Text('Select Purpose', style: TextStyle(fontWeight: FontWeight.bold),),

                      value: dropdownpur,
                      onChanged: (newValue){
                        setState(() {
                          dropdownpur = newValue as String;
                        });
                      },
                      items: <String>['Sale', 'Rent']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                SizedBox(height: 16,),
                Container(
                  height: 54,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Colors.brown.shade50,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.brown, blurRadius: 1.0)],
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: title,
                        decoration: InputDecoration(
                            hintText: 'Property Name',
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                            border: InputBorder.none
                        ),
                      )
                  ),
                ),

                SizedBox(height: 16,),
                Container(
                  height: 100,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Colors.brown.shade50,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.brown, blurRadius: 1.0)],
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: discription,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: 'Property Description',
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          border: InputBorder.none,
                        ),
                      )
                  ),
                ),

                SizedBox(height: 16,),
                Container(
                  height: 54,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Colors.brown.shade50,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.brown, blurRadius: 1.0)],
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: phone,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                            border: InputBorder.none
                        ),
                      )
                  ),
                ),

                SizedBox(height: 16,),
                Container(
                  height: 54,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Colors.brown.shade50,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.brown, blurRadius: 1.0)],
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: address,
                        decoration: InputDecoration(
                            hintText: 'Address',
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                            border: InputBorder.none
                        ),
                      )
                  ),
                ),

                SizedBox(height: 16,),
                Row(
                  children: [
                    Container(
                      height: 54,
                      width: 168,
                      margin: EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                        color: Colors.brown.shade50,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(color: Colors.brown, blurRadius: 1.0)],
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: lati,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: 'Latitude',
                                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                                border: InputBorder.none
                            ),
                          )
                      ),
                    ),
                    // Spacer(),
                    Container(
                      height: 54,
                      width: 168,
                      margin: EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                        color: Colors.brown.shade50,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(color: Colors.brown, blurRadius: 1.0)],
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: longi,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: 'Longitude',
                                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                                border: InputBorder.none
                            ),
                          )
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16,),
                Row(
                  children: [
                    Container(
                      height: 54,
                      width: 168,
                      margin: EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                        color: Colors.brown.shade50,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(color: Colors.brown, blurRadius: 1.0)],
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: bed,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: 'Bedroom',
                                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                                border: InputBorder.none
                            ),
                          )
                      ),
                    ),
                    // Spacer(),
                    Container(
                      height: 54,
                      width: 168,
                      margin: EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                        color: Colors.brown.shade50,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(color: Colors.brown, blurRadius: 1.0)],
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: bath,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: 'Bathroom',
                                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                                border: InputBorder.none
                            ),
                          )
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16,),
                Row(
                  children: [
                    Container(
                      height: 54,
                      width: 168,
                      margin: EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                        color: Colors.brown.shade50,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(color: Colors.brown, blurRadius: 1.0)],
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: area,
                            decoration: InputDecoration(
                                hintText: 'Area',
                                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                                border: InputBorder.none
                            ),
                          )
                      ),
                    ),
                    // Spacer(),
                    Container(
                      height: 54,
                      width: 168,
                      margin: EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                        color: Colors.brown.shade50,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(color: Colors.brown, blurRadius: 1.0)],
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: price,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: 'Price',
                                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                                border: InputBorder.none
                            ),
                          )
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16,),
                Container(
                  height: 54,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Colors.brown.shade50,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.brown, blurRadius: 1.0)],
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: amenities,
                        decoration: InputDecoration(
                            hintText: 'Amenities(ex. Lawn, Internet)',
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                            border: InputBorder.none
                        ),
                      )
                  ),
                ),

                SizedBox(height: 16,),
                Container(
                  height: 54,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Colors.brown.shade50,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.brown, blurRadius: 1.0)],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      hint: Text('Select Furnished', style: TextStyle(fontWeight: FontWeight.bold),),

                      value: dropdownfur,
                      onChanged: (newValue){
                        setState(() {
                          dropdownfur = newValue as String;
                        });
                      },
                      items: <String>['Furnished', 'Semi-Furnished', 'Unfurnished']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                SizedBox(height: 6,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Featured Image', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700, fontSize: 16),),
                ),

                // SizedBox(height: 2,),
                DottedBorder(
                  color: Colors.brown,
                  dashPattern: [10,6],
                  borderType: BorderType.RRect,
                  radius: Radius.circular(16),
                  // strokeCap: StrokeCap.round,
                  borderPadding: EdgeInsets.only(right: 15, left: 15),
                  strokeWidth: 2,
                  child: Container(
                    height: 121,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        color: Colors.brown.shade50,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_circle_outlined, color: Colors.brown, size: 26,),
                            // SizedBox(width: 3,),
                            TextButton(onPressed: () {
                              imagefirst();

                            }, child: Text('Select Image', style: TextStyle(color: Colors.grey.shade700, fontSize: 15, fontWeight: FontWeight.bold)))
                          ],
                        ),
                        imageFile==null?
                        EditPropertyData['image']==null?
                            Center(child: CircularProgressIndicator()):
                        Image.network(EditPropertyData['image'], height: 70, width: 360, fit: BoxFit.cover):
                        Image.file(imageFile!, height: 70, width: 360, fit: BoxFit.cover)
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 6,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Floor Plan Image', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700, fontSize: 16),),
                ),

                // SizedBox(height: 2,),
                DottedBorder(
                  color: Colors.brown,
                  dashPattern: [10,6],
                  borderType: BorderType.RRect,
                  radius: Radius.circular(16),
                  // strokeCap: StrokeCap.round,
                  borderPadding: EdgeInsets.only(right: 15, left: 15),
                  strokeWidth: 2,
                  child: Container(
                    height: 121,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        color: Colors.brown.shade50,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_circle_outlined, color: Colors.brown, size: 26,),
                            TextButton(onPressed: () {
                              imagePickers();

                            }, child: Text('Select Image', style: TextStyle(color: Colors.grey.shade700, fontSize: 15, fontWeight: FontWeight.bold)))
                          ],
                        ),
                        imageFloor==null?
                            EditPropertyData['floor_plan_image']==null?
                            Center(child: CircularProgressIndicator()):
                            Image.network(EditPropertyData['floor_plan_image'], height: 70, width: 360, fit: BoxFit.cover,):
                        Image.file(imageFloor!, height: 70, width: 360, fit: BoxFit.cover,)
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 6,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Gallery Image', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700, fontSize: 16),),
                ),

                SizedBox(height: 2,),
                DottedBorder(
                  color: Colors.brown,
                  dashPattern: [10,6],
                  borderType: BorderType.RRect,
                  radius: Radius.circular(16),
                  // strokeCap: StrokeCap.round,
                  borderPadding: EdgeInsets.only(right: 15, left: 15),
                  strokeWidth: 2,
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        color: Colors.brown.shade50,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_circle_outlined, color: Colors.brown, size: 26,),
                            TextButton(onPressed: () {
                              selectImages();

                            }, child: Text('Select Image', style: TextStyle(color: Colors.grey.shade700, fontSize: 15, fontWeight: FontWeight.bold)))
                          ],
                        ),
                        EditPropertyData.isEmpty?CircularProgressIndicator():
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            children: List.generate(imageFiles.length, (index) {
                              return Stack(
                                fit: StackFit.expand,
                                children: [
                                  Container(
                                      height: 70,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: imageFiles==null?
                                      EditPropertyData[0]['gallery_list'][index]['gallery_image']==null?
                                      Center(child: CircularProgressIndicator()):
                                      Image.network(EditPropertyData[0]['gallery_list'][index]['gallery_image'],
                                          fit: BoxFit.cover):
                                      Image.file(File(imageFiles[index]), fit: BoxFit.cover,)
                                  ),
                                  Positioned(
                                      right: -2,
                                      top: -9,
                                      child: IconButton(
                                          icon: Icon(
                                            Icons.cancel,
                                            color: Colors.red,
                                          ),
                                          onPressed: () => setState(() {
                                            imageFiles.removeAt(index);
                                          })))
                                ],
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // DottedBorder(
                //   color: Colors.brown,
                //   dashPattern: [10,6],
                //   borderType: BorderType.RRect,
                //   radius: Radius.circular(16),
                //   // strokeCap: StrokeCap.round,
                //   borderPadding: EdgeInsets.only(right: 15, left: 15),
                //   strokeWidth: 2,
                //   child: Container(
                //     height: 150,
                //     width: double.infinity,
                //     margin: EdgeInsets.only(left: 16, right: 16),
                //     decoration: BoxDecoration(
                //         color: Colors.brown.shade50,
                //         borderRadius: BorderRadius.circular(12)
                //     ),
                //     child: Column(
                //       children: [
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Icon(Icons.add_circle_outlined, color: Colors.brown, size: 26,),
                //             TextButton(onPressed: () {
                //               selectImages();
                //
                //             }, child: Text('Select Image', style: TextStyle(color: Colors.grey.shade700, fontSize: 15, fontWeight: FontWeight.bold)))
                //           ],
                //         ),
                //         Expanded(
                //           child: GridView.count(
                //             crossAxisCount: 3,
                //             crossAxisSpacing: 5,
                //             mainAxisSpacing: 5,
                //             children: List.generate(EditPropertyData[0]['gallery_list'].length, (index) {
                //               return Stack(
                //                 fit: StackFit.expand,
                //                 children: [
                //                   Container(
                //                       height: 70,
                //                       width: 300,
                //                       decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(30),
                //                       ),
                //                       child: imageFiles==null?
                //                       EditPropertyData[0]['gallery_list'][index]['gallery_image']==null?
                //                       Center(child: CircularProgressIndicator()):
                //                       Image.network(EditPropertyData[0]['gallery_list'][index]['gallery_image'],
                //                           fit: BoxFit.cover):
                //                       Image.file(File(imageFiles[index]), fit: BoxFit.cover,)
                //                   ),
                //                   Positioned(
                //                       right: -2,
                //                       top: -9,
                //                       child: IconButton(
                //                           icon: Icon(
                //                             Icons.cancel,
                //                             color: Colors.red,
                //                           ),
                //                           onPressed: () => setState(() {
                //                             imageFiles.removeAt(index);
                //                           })))
                //                 ],
                //               );
                //             }),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(height: 90,),
              ],
            ),
          ),
        ),
      ),

      bottomSheet: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: 56,
          width: double.infinity,
          child: ElevatedButton(onPressed: () {
            saveProperty(widget.postid);


          }, child: Text('Update', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.brown),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
            ),
          ),
        ),
      ),
    );
  }

  editUserProperty(int postid) async {
    String ba64 = base64.encode("{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"post_id\":\"$postid\"}".codeUnits);

    final response = await http.post(Uri.parse(EditPropertyUrl),
        body: {
          'data': ba64
        });
    if(response.statusCode == 200){
      setState(() {

      });
      final data = jsonDecode(response.body);
      if(data['status_code'] == 200){
        EditPropertyData = data['REAL_ESTATE_APP'];
        title.text = EditPropertyData['title'];
        discription.text = EditPropertyData['description'];
        phone.text = EditPropertyData['phone'];
        address.text = EditPropertyData['address'];
        lati.text = EditPropertyData['latitude'];
        longi.text = EditPropertyData['longitude'];
        bed.text = EditPropertyData['bedrooms'];
        bath.text = EditPropertyData['bathrooms'];
        area.text = EditPropertyData['area'];
        price.text = EditPropertyData['price'].toString();
        amenities.text = EditPropertyData['amenities'];
        dropdowncat = EditPropertyData['type_id'];
        dropdownpur = EditPropertyData['purpose'];
        dropdownfur = EditPropertyData['furnishing'];

        // print(EditPropertyData);
        setState(() {

        });
      }else{

      }
    }
  }

  saveProperty(int postid) async {
    String ba64 = base64.encode("{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"post_id\":\"$postid\",\"user_id\":\"${hiveBox.get('user_id')}\",\"type_id\":\"${dropdowncat.toString().trim()}\",\"title\":\"${title.text.trim()}\",\"description\":\"${discription.text.trim()}\",\"phone\":\"${phone.text.trim()}\",\"address\":\"${address.text.trim()}\",\"latitude\":\"${lati.text.trim()}\",\"longitude\":\"${longi.text.trim()}\",\"purpose\":\"$dropdownpur\",\"bedrooms\":\"${bed.text.trim()}\",\"bathrooms\":\"${bath.text.trim()}\",\"area\":\"${area.text.trim()}\",\"furnishing\":\"$dropdownfur\",\"amenities\":\"${amenities.text.trim()}\",\"price\":\"${price.text.trim()}\",\"verified\":\"YES\"}".codeUnits);

    var request = http.MultipartRequest('POST', Uri.parse(SavePropertyUrl));
    request.fields['data'] = ba64;
    if(imageFile!=null){
      request.files.add(await http.MultipartFile.fromPath('featured_image', imageFile!.path));
    }

    if(imageFloor!=null){
      request.files.add(await http.MultipartFile.fromPath('floor_plan_image', imageFloor!.path));
    }

      for (var filePath in imageFiles) {
        var file = await http.MultipartFile.fromPath(
          'image_gallery', // Name of the field which receives the file on the server side
          filePath,
          contentType: MediaType.parse(lookupMimeType(filePath) ?? 'application/octet-stream'),
        );
        request.files.add(file);
      }

    final response = await request.send();
    final responseString = await response.stream.bytesToString();

    if(response.statusCode == 200){
      print('------Gallery_Image-------$imageFiles');
      Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationPage(index: 3),));
      setState(() {
        print('-----okk----');
      });
    }
  }

  Future<void> imagefirst() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      imageFile = File(file!.path);
    });
  }

  Future<void> imagePickers() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      imageFloor = File(file!.path);
    });
  }

  Future<void> galleryPickers() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      gallery = File(file!.path);
    });
  }

  void selectImages() async {
    imageFileList = await imagePicker.pickMultiImage();
    if (imageFileList != null) {
      for(XFile file in imageFileList!) {
        for(int i=0; i<imageFiles.length; i++) {
          imageFiles.add(file.path);
        }
      }
      setState(() {

      });
    }else{
    }
  }

  Future<List<int>> convertAssetToBytes(Asset asset) async {
    ByteData byteData = await asset.getByteData();
    return byteData.buffer.asUint8List();
  }
}
