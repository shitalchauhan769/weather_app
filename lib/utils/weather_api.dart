import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:sky_app/screen/home/model/home_model.dart';
class SkyAPI
{

  Future<HomeModel?>? SkyHelperAPI(String city)
  async {
    String link="https://api.openweathermap.org/data/2.5/weather?q=$city&appid=c7cbbe4edb4df7d4449f3291ab40735e&units=metric";

    var response=await http.get(Uri.parse(link),);

    if(response.statusCode==200)
    {
      var  json =jsonDecode(response.body);
      HomeModel? weatherModel=HomeModel.mapToModel(json);

      return weatherModel;

    }
    return null;

  }
}