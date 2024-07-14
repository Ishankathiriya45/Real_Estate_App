import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../Navigator.dart';
import '../main.dart';
import 'all_api.dart';

List categoryAll = [];

List propertyCategory = [];

List latestPropertyMax = [];

List latestPropertyMin = [];

List categoryDetail = [];

List popularProperty = [];

List filterProperty = [];

Map<String, dynamic> profileDetail = {};

List FavouriteDetail = [];

List SearchProperty = [];

List PropertyAddList = [];

List PropertyAddData = [];

// List EditPropertyData = [];

Map<String, dynamic> EditPropertyData = {};

List propertyViewList = [];

getLatestData(int userId){
  String ba64 = base64.encode( "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"user_id\":\"5\",\"filter_by\":\"price_high\"}".codeUnits);
}

getPopularData(int userId){
  String ba64 = base64.encode( "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"user_id\":\"$userId\"}".codeUnits);
}

getSearchData(int userId){
  String ba64 = base64.encode( "{\"package_name\":\"com.example.realestate\",\"salt\":\"682\",\"sign\":\"27318dfb45fa057c5a9d3e084ea8ed61\",\"user_id\":\"$userId\"}".codeUnits);
}

