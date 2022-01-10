import 'dart:convert';

import 'package:componentes_2/src/models/Blog.dart';
import 'package:componentes_2/src/utils/app_config.dart';
import 'package:http/http.dart';

class BlogProvider{
  final String url = Api().baseUrl;
  
  Future<List<Blog>> fetchBlogs() async{
    Response res = await get(Uri.parse(url + 'posts'));

    if(res.statusCode == 200){
      List<dynamic> body = jsonDecode(res.body);
      List<Blog> blogs = body.map( (blog)=> Blog.fromJson(blog)).toList();
      return blogs;
    }else {
      throw Exception('Not Found');
    }

  }
}