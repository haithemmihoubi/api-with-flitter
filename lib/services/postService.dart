import 'package:api2021/models/Post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/Post.dart';

/*
TODO for fetching one post
class PostApi {
  var apiUrl = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");

  Future<Post?> fetchData() async {
    var res = await http.get(apiUrl);
    if (res.statusCode == 200) {
      var data = res.body;
      var jsonData = jsonDecode(data);
      Post posts = Post.fromJson(jsonData);

      return posts;
    }
    else {
      print('status code ${res.statusCode}');
    }
  }
}*/
//TODO for fetching multi post and nested json
class PostApi {
  var apiUrl = Uri.parse("https://jsonplaceholder.typicode.com/posts");

  Future<List<Post>?> fetchData() async {

      var res = await http.get(apiUrl);
      if (res.statusCode == 200) {
        var data = res.body;
        var jsonData = jsonDecode(data);
        Posts posts = Posts.fromJson(
            {"postList":[
              {
                "userId": 1,
                "id": 1,
                "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
                "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
              },
              {
                "userId": 1,
                "id": 2,
                "title": "qui est esse",
                "body": "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
              },
              {
                "userId": 1,
                "id": 3,
                "title": "ea molestias quasi exercitationem repellat qui ipsa sit aut",
                "body": "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut"
              },
            ]
            }
        );
        List<Post> plist = posts.postList.map((e) => Post.fromJson(e)).toList();
        return plist;
      } else {
        print('status code ${res.statusCode}');
      }
    }

}
