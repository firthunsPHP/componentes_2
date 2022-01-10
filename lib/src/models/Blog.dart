
// import 'dart:convert';
// https://app.quicktype.io/
class Blog {

  int? userId;
  int? id;
  String? title;
  String? body;

  Blog({
    this.userId,
    this.id,
    this.title,
    this.body,
  });


  //
  // factory Blog.fromRawJson(String str) => Blog.fromJson(json.decode(str));
  //
  // String toRawJson() => json.encode(toJson());

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
    userId: json['userId'] as int?,
    id: json['id'] as int?,
    title: json['title'] as String? ,
    body: json['body'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'id': id,
    'title': title,
    'body': body,
  };
}
