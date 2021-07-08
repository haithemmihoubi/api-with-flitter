import 'package:api2021/services/postService.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'models/Post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo api',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var p;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    p = PostApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('api demo'),
        centerTitle: true,
      ),
      body: Center(
        child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async {
              // TODO fetching  one post
              /* var data = await p.fetchData();

              print(data.id);
              print(data.title);
              print(data.body); */
              // TODO fetching  multi post

              List<Post> data = await p.fetchData();
              for (final i in data) {
                print(i.id.toString());
                print(i.body.toString());
              }
            }),
      ),

      /*Center(
          child: FutureBuilder(
        future: fetchPhotos(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return CircularProgressIndicator() ;
        }else {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(snapshot.data[index]['title'].toString()),
                leading: CircleAvatar(
                  child: Icon(Icons.add),
                  backgroundImage: NetworkImage(snapshot
                      .data[index]['thumbnailUrl']),
                ),
                subtitle: Text(snapshot.data[index]['id'].toString()),
              );
            },
          );
        }
        },
      )),*/
    );
  }
}
