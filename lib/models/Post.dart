import 'package:api2021/services/postService.dart';
import 'package:flutter/material.dart';

class Post {
  int userId, id;

  String title, body;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Post.fromJson(Map<String, dynamic> jsonData) {
    return Post(
        userId: jsonData['userId'],
        id: jsonData['id'],
        title: jsonData['title'],
        body: jsonData['body']);
  }
}

class Posts {
  final List<dynamic> postList;

  Posts({required this.postList});

  factory Posts.fromJson(Map<String, dynamic> jsonData) {
    return Posts(postList: jsonData['postList']);
  }
}
