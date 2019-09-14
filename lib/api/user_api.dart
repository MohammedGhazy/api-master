import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart'as http;
import 'package:api/model/user_model.dart';

class UserApi{
  Future<List<User>> fetchUsersFromGitHub() async {
    final response = await http.get('https://api.github.com/users');
    print(response.body);
    List responseJson = json.decode(response.body.toString());
    List<User> userList = createUserList(responseJson);
    return userList;
  }
  List<User> createUserList(List data){
    List<User> list = new List();
    for (int i = 0; i < data.length; i++) {
      String title = data[i]["login"];
      String avatar_url = data[i]['avatar_url'];
      int id = data[i]["id"];
      User movie = new User(name: title,id: id,avatar_url: avatar_url);
      list.add(movie);
    }
    return list;
  }
}

