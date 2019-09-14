import 'package:flutter/material.dart';
import 'package:api/model/user_model.dart';
import 'package:api/api/user_api.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserApi userApi = UserApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('api'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: FutureBuilder<List<User>>(
          future: userApi.fetchUsersFromGitHub(),
          builder: (BuildContext context,AsyncSnapshot snapShot){
            if(snapShot.hasData){
              return ListView.builder
                (
                itemCount: snapShot.data.length,
                itemBuilder: (ctx , index){
                  return new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.network('${snapShot.data[index].avatar_url}'),
                        new Text(snapShot.data[index].name,
                            style: new TextStyle(fontWeight: FontWeight.bold)),
                        new Divider()
                      ]
                  );
                },
                );
            }else if(snapShot.hasError){
              return Text('${snapShot.error}');
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
