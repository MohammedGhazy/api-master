import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:api/model/post_model.dart';

class PostApi{
  Future<List<Post>> getPosts() async{
    String myUrl='https://jsonplaceholder.typicode.com/posts';
    final response = await http.get(myUrl);
    print(response.body);
    List responseJson = json.decode(response.body.toString());
    List<Post> postList = createPostsList(responseJson);
    return postList;
  }
  List<Post> createPostsList(List data){
    List<Post> list = List();
    for(int i=0;i<data.length;i++){
      String title = data[i]['title'];
      String body = data[i]['body'];
      Post movie = Post(
        title: title,
        body: body,
      );
      list.add(movie);
    }
    return list;
  }
}