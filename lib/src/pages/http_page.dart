import 'package:componentes_2/src/models/Blog.dart';
import 'package:componentes_2/src/providers/blog_provider.dart';
import 'package:flutter/material.dart';


class HttpPage extends StatelessWidget {
   HttpPage({Key? key}) : super(key: key);
  final BlogProvider http = BlogProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Peticiones HTTP')),
      body: FutureBuilder(
        future: http.fetchBlogs(),
        builder:(BuildContext context, AsyncSnapshot<List<Blog>> snapShot) {

          if (snapShot.hasData && snapShot.data != null){
            List<Blog> blogs = snapShot.data!;
            return ListView(
              children: blogs
                      .map( (Blog b) => ListTile(
                    title: Text(b.title!),
                  ))
                      .toList()
             );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

    );
  }
}
