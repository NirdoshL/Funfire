import 'dart:convert';

import 'package:apisample/Apis/apimanager.dart';
import 'package:apisample/Apis/strings.dart';
import 'package:http/http.dart' as http;
class Apimanager{
      Future<ApiNews> getnews()async{
      var client=http.Client();
      var newsmodel=null;
      var response=await client.get(Strings.newsapi);
      try{
      if (response.statusCode==200){
         var jsonString=response.body;
         var jsonMap=jsonDecode(jsonString);
         newsmodel=ApiNews.fromJson(jsonMap);
      }
      }
      catch(expt){
            return newsmodel;
      }
      return newsmodel;
      }
}